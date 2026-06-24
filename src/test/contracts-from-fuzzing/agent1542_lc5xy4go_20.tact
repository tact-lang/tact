struct Sopt {
  a: Int?;
}

contract AssignSomeNone {
  val: Sopt;

  init() {
    self.val = Sopt{a:null};
    self.val = Sopt{a:42};
  }
}