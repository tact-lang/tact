struct Deep {
  d1: Int;
  d2: Bool;
  d3: String;
  d4: Address;
}

struct Wrap {
  deep: Deep;
}

contract NestedWraps {
  w1: Wrap;
  w2: Wrap;

  init() {
    self.w1 = Wrap{deep:Deep{d1:1,d2:true,d3:"x",d4:myAddress()}};
    self.w2 = Wrap{deep:Deep{d1:2,d2:false,d3:"y",d4:myAddress()}};
  }
}