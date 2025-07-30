struct S1 {
 a: Int;
 b: Bool;
}

struct S2 {
 x: String;
 y: S1;
}

struct S3 {
 s2a: S2;
 s2b: S2;
}

contract StructChain {
  chain: S3;
  init() {
    self.chain = S3{
      s2a: S2{ x: "x1", y: S1{a:1,b:true}},
      s2b: S2{ x: "x2", y: S1{a:2,b:false}}
    };
  }
}