struct BigNested {
  s1: String;
  opt: Int?;
  nested: Nested;
}

struct Nested {
  x: Int;
  y: Bool;
  z: String;
}

contract Comp {
  f: BigNested;

  init() {
    self.f = BigNested{
      s1: "hi",
      opt: null,
      nested: Nested{x:10,y:false,z:"bye"}
    };
  }
}