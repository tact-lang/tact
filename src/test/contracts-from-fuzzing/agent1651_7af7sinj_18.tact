struct S {
 a: Int;
 b: Int?;
 c: Int as uint8;
 d: Int? as uint8;
 e: Bool;
 f: Bool?;
}

contract MixedSerializeOptional {
  val: S;

  init() {
    self.val = S{
      a: 1,
      b: null,
      c: 200,
      d: null,
      e: true,
      f: null
    };
  }
}