struct MixedNested {
  x: Int;
  y: Sub1;
  z: Sub2;
}

struct Sub1 {
  a: Int;
  b: Int?;
}

struct Sub2 {
  m: Bool;
  n: String?;
}

contract MixedNestedContract {
  val: MixedNested;
  init() {
    self.val = MixedNested{
        x: 1,
        y: Sub1{ a:2, b:null },
        z: Sub2{ m:true, n:null }
    };
  }
}