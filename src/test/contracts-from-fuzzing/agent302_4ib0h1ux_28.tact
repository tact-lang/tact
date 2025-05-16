struct NestedMany {
  n1: Int;
  n2: Bool;
  n3: String;
  n4: Int?;
  n5: Bool?;
}

contract NestedComplex {
  val: NestedMany;

  init() {
    self.val = NestedMany{
      n1:10,
      n2:true,
      n3:"hey",
      n4:null,
      n5:false
    };
  }
}