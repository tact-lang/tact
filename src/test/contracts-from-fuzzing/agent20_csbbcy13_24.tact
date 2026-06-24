struct User {
  id: Int;
}

message UserMsg {
  user: User;
}

contract Test {
  receive(msg: UserMsg) {
    let uid = msg.user.id;
  }
}