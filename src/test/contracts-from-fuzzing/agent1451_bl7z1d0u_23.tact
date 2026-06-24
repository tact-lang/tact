struct BigMix {
  i: Int;
  bo: Bool;
  s: String;
  optI: Int?;
  optB: Bool?;
  optS: String?;
}

contract MixedStorage {
  data: BigMix;

  init() {
    self.data = BigMix{
      i:1,
      bo:true,
      s:"str",
      optI:null,
      optB:false,
      optS:null
    };
  }
}
