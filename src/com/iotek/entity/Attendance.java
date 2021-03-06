package com.iotek.entity;

import java.util.Date;
//����
public class Attendance {
	private int id;
	private int userId;
	private String uName;
	private Date officeHours;
	private Date closingTime;
	private String late;
	private String leaveEarly;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public Date getOfficeHours() {
		return officeHours;
	}
	public void setOfficeHours(Date officeHours) {
		this.officeHours = officeHours;
	}
	public Date getClosingTime() {
		return closingTime;
	}
	public void setClosingTime(Date closingTime) {
		this.closingTime = closingTime;
	}
	public String getLate() {
		return late;
	}
	public void setLate(String late) {
		this.late = late;
	}
	public String getLeaveEarly() {
		return leaveEarly;
	}
	public void setLeaveEarly(String leaveEarly) {
		this.leaveEarly = leaveEarly;
	}
	public Attendance() {
		super();
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Attendance(int id, int userId, String uName, Date officeHours, Date closingTime, String late,
			String leaveEarly) {
		super();
		this.id = id;
		this.userId = userId;
		this.uName = uName;
		this.officeHours = officeHours;
		this.closingTime = closingTime;
		this.late = late;
		this.leaveEarly = leaveEarly;
	}
	@Override
	public String toString() {
		return "Attendance [id=" + id + ", userId=" + userId + ", uName=" + uName + ", officeHours=" + officeHours
				+ ", closingTime=" + closingTime + ", late=" + late + ", leaveEarly=" + leaveEarly + "]";
	}
}
