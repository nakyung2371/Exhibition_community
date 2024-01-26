package users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.JDBCUtil;

public class UsersDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	private final String MEMBER_INSERT =
			"insert into member (u_id, u_password, u_name, u_nickname, phone, gender)"
			+ "values (?, ?, ?, ?, ?, ?)";
	
	//DB의 users 테이블의 모든 레코드를 출력하는 쿼리: 레코드가 여러 개: dto -> AraayList 리턴
	//private final String USERS_LIST = "select * from users order by u_id asc";

	private final String USERS_LOGIN = "select * from users where u_id = ? and u_password = ?";
	
	//로그인 메소드
	public UsersDTO login(UsersDTO dto) {
		System.out.println("login 메소드 호출");
		
		UsersDTO users = null;
		
		try {
			conn = JDBCUtil.getConnection();
			//USERS_LOGIN = "select * from users where u_id = ? and u_password = ?";
			pstmt = conn.prepareStatement(USERS_LOGIN);
			
			//? 변수의 값 할당
			pstmt.setString(1, dto.getU_id());
			pstmt.setString(2, dto.getU_password());
			
			//pstmt 실행 후 rs로 쿼리한 레코드 저장
			rs = pstmt.executeQuery();
			
			//rs의 값이 존재할 때 인증 성공: 레코드 1개가 출력
			while (rs.next()) {
				
				//리턴으로 돌려줄 dto 선언
				users = new UsersDTO();
				
				users.setU_id(rs.getString("U_ID"));
				users.setU_password(rs.getString("U_PASSWORD"));
				users.setU_name(rs.getString("U_NAME"));
				users.setU_nickname(rs.getString("U_NICKNAME"));
				users.setPhone(rs.getString("PHONE"));
				users.setGender(rs.getInt("GENDER"));
				
				System.out.println(" - 인증 성공: 해당 ID와 Password가 DB에 존재합니다.");
			}
			
		} catch (Exception e) {
			System.out.println("인증 오류가 발생하였습니다.");
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(rs, pstmt, conn);
			
		}
		
		return users;
	}
}
