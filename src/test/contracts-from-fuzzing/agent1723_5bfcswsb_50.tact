struct Deeply {
  a: Int;
  b: String?;
  c: Bool;
  d: Address?;
}

contract HasDeeply {
  val: Deeply;

  init() {
    self.val=Deeply{a:5,b:null,c:true,d:null};
  }
}