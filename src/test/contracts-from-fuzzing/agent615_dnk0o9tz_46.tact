struct BigNested {
  s1: Inner1;
  s2: Inner2;
}
struct Inner1 { x: Int; y: Int }
struct Inner2 { a: Int?; b: Int }

contract TestContract {
  s: BigNested;

  init() {
    self.s = BigNested {
      s1: Inner1 { x: 1, y: 2 },
      s2: Inner2 { a:null, b:3 }
    };
  }
}