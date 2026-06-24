struct Composite {
  i: Int;
  b: Bool;
  s: String;
  io: Int?;
  bo: Bool?;
  so: String?;
}

contract ComboTest {
  val: Composite;
  init() {
    self.val = Composite{ i:1, b:true, s:"x", io:null, bo:null, so:null };
  }
}