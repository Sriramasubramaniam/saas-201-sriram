class Department
	attr_accessor :deptname , :sections, :studentslist, :studentdetail

	def initialize(name)
		self.deptname=name
		self.sections={'A'=>10,'B'=>10,'C'=>10}
		self.studentslist={}
		self.studentdetail={}
	end

	def show
		puts self.deptname
	end

  def add_to_list(stud_name,section)
		studentslist[stud_name]=section
	end

  def dept_available
    if self.section['A'] || self.section['B'] || self.section['C']
      return self.deptname
    else
      puts "Sorry the department is not available "
		end
	end

	def change_sect(stud_name,old_sect,new_sect)
		if self.sections[new_sect] >= 1
			sect=new_sect
			studentslist[stud_name]=sect
			self.sections[old_sect]+=1
		end
		return sect
	end

  def allot_section
    if self.sections['A'] >= 1
    	sect='A'
    elsif self.sections['B'] >=1
    	sect='B'
    elsif self.sections['C'] >= 1
    	sect='C'
    else
    	sect="Error"
    end
    return sect
  end

  def allot_rollno
		  z=0
			e = "Error"
  		if self.sections['A'] >= 1
  			sect=10-self.sections["A"]+1
				if sect <= 9
					sect = 'A'+z.to_s+sect.to_s
				else
					sect='A'+sect.to_s
				end
  			self.sections['A']=self.sections['A']-1
  		elsif self.sections['B'] >=1
  			sect=10-self.sections["B"]+1
				if sect <= 9
					sect = 'B'+z.to_s+sect.to_s
				else
					sect='B'+sect.to_s
				end
  			self.sections['B']=self.sections['B']-1
  		elsif self.sections['C'] >= 1
  			sect=10-self.sections["C"]+1
				if sect <= 9
					sect = 'C'+z.to_s+sect.to_s
				else
					sect='C'+sect.to_s
				end
  			self.sections['C']=self.sections['C']-1
  		else
  			sect = e
  		end
  		return sect
  end
	def allot_specific_rollno(section)
		z=0
		if self.sections[section] >= 1
			sect=9-self.sections[section]+1
			if sect <= 9
				sect = section+z.to_s+sect.to_s
			else
				sect=section+sect.to_s
			end
			self.sections[section]=self.sections[section]-1
		else
			sect=0
		end
		return sect
	end

  def increment_section(section)
    #section = studentslist[stud_name]
    #if self.sections[section]<10
      self.sections[section] += 1
  end

  def update_list(stud_name)
    studentslist.delete(stud_name)
		studentdetail.delete(stud_name)
  end

	def update_detail_list(name,rollno)
		studentdetail[name]=rollno
	end
end
