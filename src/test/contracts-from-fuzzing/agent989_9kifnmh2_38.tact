struct SOpt {
  s: String?;
  b: Bool;
  i: Int;
}

contract OptField {
  val: SOpt;

  init() {
    self.val = SOpt{ s:null, b:true, i:5 };
  }
}