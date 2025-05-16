struct Phone {
  number: String;
  verified: Bool;
}

struct User {
  id: Int;
  name: String;
  phone: Phone?;
}

contract UsersDb {
  u: User;

  init() {
    self.u = User{id:1, name:"Alice", phone:null};
  }
}