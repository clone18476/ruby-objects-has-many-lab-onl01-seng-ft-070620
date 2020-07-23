require 'pry' 

class Doctor 
  attr_accessor :name 
end 


class Appointment
  attr_accessor :date, :doctor, :patient #these are instance variables, the iformation that we need to access within the appointment class 
  
  @@all = [] 
  # the Appointment class is our JOIN TABLE 
  # for the sake of the single source of truth, it's really important to keep track of all of our appointments
  # !!!! this is getting the belongs_to method set up
  def initialize(doctor, patient, date) #we would only havea n appointment when we have a doctor, a patient, and a date 
    @doctor = doctor
    @patient = patient 
    @date = date
    @@all << self
  end 
  
  def self.all 
    @@all 
  end 
  
end 


class Patient 
  attr_accessor :name 
  def initialize(name)
    @name = name 
  end 
  
  def appointments #if we want our patient to know about the appointment it has, we do this: 
    Appointment.all.select {|appt| appt.patient == self}
  end 
  # !!!! this is getting the has_many method set up 
  def doctors
    # we could put appts = Appointment.all.select {|appt| appt.patient == self} but there's no reason to re-write the code, the point is we cannot access the doctors without going through the apppintments 
    self.appointments.collect do |appt|
      appt.doctor
    end.uniq #same things as if we stored it as a collect statement into a varaible and then called uniq on that, it's just cutting out the middle man 
  end 
  
end 


d1 = Doctor.new("Dr. Jones")
d2 = Doctor.new("Dr. Who")
p1 = Patient.new("Andew")
p2 = Patient.new("Carter") 
appt1 = Appointment.new(d1, p2, "Monday")
appt2 = Appointment.new(d2, p1, "Friday") #nothing is connecting any of the doctors or patients or dates except what we've set to the Appointment class. It's the appointment that knows that the doctor and patient have this relationship



binding.pry 
