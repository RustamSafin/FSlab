 
class User
attr_accessor :name, :age, :phone, :address, :comments
def initialize(name,age,phone,address,comments)
@age,@name,@phone,@address,@comments=age,name,phone,address,comments
end
end
class UsersList
def initialize()
@users = []
end

def add(user)
@users « user
end

def get(index)
@users[index]
end

def print()
@users.each {
|user| puts("#{user.name},#{user.age},#{user.phone},#{user.address},#{user.comments}")
}
end
def method_missing(name,param)

name = name[8..-2]
if (name=="age")
@users.sort!{
|x,y| x.age.to_i<=> y.age.to_i
}
else
@users.sort! {
|x,y| x.send(name) <=> y.send(name)
}
end
end
end
class Csvfile
def initialize(path)
@file=File.open(path)
@head=@file.gets
end
def read(usersList)
while (param=@file.gets)
array=param.split(",")
userList.add(User.new(array[0],array[1],array[2],array[3],array[4]))
end
@file.close
return usersList
end
end

data=Csvfile.new('/home/rustam/Labworks/list.csv')
usersList=UsersList.new()
usersList=data.readFile(usersList)
usersList.sort_by_phone!(true)
usersList.print