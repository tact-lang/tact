struct MixNest {
  s1: Int;
  s2: Bool;
  s3: InnerStruct;
}

struct InnerStruct {
  x: Int;
  flag: Bool;
}

contract NestFields {
  data: MixNest;
  init() {
    self.data = MixNest{
      s1:5,s2:true,
      s3:InnerStruct{ x:10, flag:false }
    };
  }
}