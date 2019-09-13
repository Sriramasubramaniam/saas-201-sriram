 require_relative './department' # Include other files in the same directory

# Your application
class Application
   attr_accessor :departments

  def initialize
   self.departments=[]
   ['EEE','MECH','CSE','CIVIL'].each do |dept|
     self.departments<< Department.new(dept)
   end
  end

  def enroll(student_name, student_department)
    name = student_name
    department = departments.detect { |dept| dept.deptname == student_department }
    #department = department.dept_available
    #puts "FFF "+department.deptname
    section = department.allot_section
    roll_no = department.deptname + department.allot_rollno.to_s
    department.studentdetail[name]=roll_no
    temp= "You have been enrolled to #{student_department}" \
          "\nYou have been allotted section #{section}" \
          "\nYour roll number is #{roll_no.to_s}"
    department.add_to_list(name,section)

    return temp

  end

  def change_dept(student_name, new_department)
    name = student_name
    self.departments.each do |dept|
      if (dept.studentslist.has_key? name)==true
        old_dept = departments.detect { |dept| dept.studentslist.has_key? name }
      #  print ('jjj'+old_dept.deptname)
        new_dept = departments.detect { |dept| dept.deptname == new_department }
        old_dept_section = old_dept.studentslist[name]
        section = new_dept.allot_section
        roll_no = new_dept.deptname + new_dept.allot_rollno
        new_dept.studentdetail[name]=roll_no
        temp =  "You have been enrolled to #{new_dept.deptname}" \
          "\nYou have been allotted section #{section}" \
          "\nYour roll number is #{roll_no.to_s}"
          new_dept.add_to_list(name,section)
          old_dept.increment_section(old_dept_section)
          old_dept.update_list(name)
      else
        temp = "Student doesn't exist"
        next
      end
    return temp
    end
  end

  def change_section(student_name, new_section)
    name = student_name
    self.departments.each do |dept|
      if (dept.studentslist.has_key? name)==true
        department = departments.detect { |dept| dept.studentslist.has_key? name }
        old_section = department.studentslist[name]
        puts old_section
        department.increment_section(old_section)
        new_sect = department.change_sect(name,old_section,new_section)
        roll_no = department.deptname + department.allot_specific_rollno(new_sect)
        department.update_detail_list(name,roll_no)
        rollno = department.studentslist[name]
        temp =  "You have been allotted section #{new_sect}" \
             "\nYour roll number is #{roll_no.to_s}"
      else
        temp = "Student doesn't exist"
        next
      end
    return temp
    end
  end

  def department_view(student_dept)
    department = departments.detect { |dept| dept.deptname == student_dept }
    temp="List of students:"
    department.studentdetail.each do |key,value|
      temp += "\n#{key} - #{value}"
    end
    return temp
  end

  def section_view(student_dept, section)
    department = departments.detect { |dept| dept.deptname == student_dept }
    default =  "List of students:"
    department.studentdetail.each do |key,value|
      if value[-3] == section
        default+= "\n#{key} - #{value}"
      end
    end
    return default
  end

  def student_details(student_name)
    name = student_name
    self.departments.each do |dept|
      if (dept.studentslist.has_key? name)==true
        department = departments.detect { |dept| dept.studentslist.key? name }
        dept = department.deptname
        section = department.studentslist[name]
        rollno = department.studentdetail[name]
        temp = "#{name} - #{dept} - Section #{section} - #{rollno.to_s}"
      else
        temp = "Student doesn't exist"
        next
      end
    return temp
    end
  end
end
