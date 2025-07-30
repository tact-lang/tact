struct S {
 a: Int;
 b: Bool;
 c: String;
 d: Int?;
 e: Bool?;
 f: String?;
}

contract StructMix {
  data: S;

  init() {
    self.data = S{
      a:1,
      b:true,
      c:"abc",
      d:null,
      e:null,
      f:null
    };
  }
}