package users;

import java.sql.Date;

import lombok.Data;

@Data
public class UsersDTO {
	
	private String u_id;
	private String u_password;
	private String u_name;
	private String u_nickname;
	private String phone;
	private int gender;

}

/*
CREATE TABLE users (
	u_id varchar2(100) NOT NULL constraint PK_USER_U_ID primary key,
	u_password varchar2(100) NOT NULL,
	u_name varchar2(100) NOT NULL,
	u_nickname varchar2(100) NOT NULL,
	phone varchar2(50) NOT NULL,
	gender number(1) NOT NULL
);
*/