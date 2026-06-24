struct BoolMix {
  b1: Bool;
  b2: Bool;
  b3: Bool?;
  b4: Bool?;
}

contract PackedBools {
  vals: BoolMix;

  init() {
    self.vals = BoolMix{b1:true,b2:false,b3:null,b4:true};
  }
}