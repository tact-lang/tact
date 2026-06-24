struct ManyTypes {
  i: Int;
  s: String;
  b: Bool;
  opti: Int?;
  opts: String?;
  optb: Bool?;
}

struct NestMix {
  m: ManyTypes;
  flag: Bool;
}

contract MixNest {
  data: NestMix;

  init() {
    self.data = NestMix{
      m: ManyTypes{
        i:1,s:"a",b:true,
        opti:null,opts:null,optb:false
      },
      flag: true
    };
  }
}