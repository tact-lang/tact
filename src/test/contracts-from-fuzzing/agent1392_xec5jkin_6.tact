struct BigMix {
  i1: Int;
  b1: Bool;
  s1: String;
  i2: Int?;
  b2: Bool?;
  s2: String?;
  i3: Int;
  b3: Bool;
  s3: String;
  i4: Int?;
}

contract BigMixContract {
  storage: BigMix;

  init() {
    self.storage = BigMix {
      i1: 1, b1:true, s1:"a",
      i2:null, b2:null, s2:null,
      i3:3, b3:false, s3:"end",
      i4:null
    };
  }
}