struct Rec1 {
  val: Int;
  nested: Rec2;
}

struct Rec2 {
  txt: String;
}

contract SerialNested {
  stored: Rec1;

  init() {
    self.stored = Rec1{
      val:99,
      nested:Rec2{ txt:"foo" }
    };
  }
}