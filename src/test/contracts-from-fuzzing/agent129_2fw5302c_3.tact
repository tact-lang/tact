struct DeepInner {
  m: Int?;
  n: Bool?;
  s: String?;
}

struct Outer {
  a: Int;
  b: DeepInner?;
  c: Bool?;
}

contract TestContract {
  data: Outer;

  init() {
    self.data = Outer{
      a: 11,
      b: DeepInner{
        m: 42,
        n: false,
        s: "deep"
      },
      c: true
    };
  }
}