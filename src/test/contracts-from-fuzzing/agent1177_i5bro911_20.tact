struct BigNested {
  a: Inner1;
  b: Inner2;
}

struct Inner1 {
  x: Int;
  y: Int;
  z: Int;
}

struct Inner2 {
  m: Bool;
  n: String;
}

contract BigNestedStruct {
  val: BigNested;

  init() {
    self.val = BigNested{
      a: Inner1{ x:1, y:2, z:3 },
      b: Inner2{ m:true, n:"abc" }
    };
  }
}
