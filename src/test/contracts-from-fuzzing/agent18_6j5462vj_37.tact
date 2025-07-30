struct NestedMany {
  x1: Int;
  x2: Int?;
  x3: String;
  x4: String?;
  x5: Bool;
  x6: Bool?;
  x7: Address;
  x8: Address?;
}

contract BigNested {
  big: NestedMany;

  init() {
    self.big = NestedMany{
      x1:1, x2:null, x3:"a", x4:null, x5:true, x6:null, x7:myAddress(), x8:null
    };
  }
}