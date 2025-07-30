struct Sopt {
  v: Int?;
}

contract OptionalStruct {
  s: Sopt?;

  init() {
    self.s = Sopt{v:99};
  }
}
