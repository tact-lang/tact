struct Deep1 { a: Int; }
struct Deep2 { d1: Deep1; b: Bool; }
struct Deep3 { d2: Deep2; c: Int; }

contract DeepContract {
  deep: Deep3;

  init() {
    self.deep = Deep3{ d2: Deep2{ d1: Deep1{ a: 5 }, b: true }, c: 10 };
  }

  receive() {
    let _ = self.deep;
  }
}