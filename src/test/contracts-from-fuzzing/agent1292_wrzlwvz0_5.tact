struct Deep1 { i: Int; b: Bool; }
struct Deep2 { one: Deep1; two: Deep1; }
struct Deep3 { p: Deep2; flag: Bool; }

contract Test {
  data: Deep3;

  init() {
    self.data = Deep3 {
      p: Deep2 {
        one: Deep1 { i: 1, b: true },
        two: Deep1 { i: 2, b: false }
      },
      flag: true
    };
  }
}