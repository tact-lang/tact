struct Deep1 { val: Int; }
struct Deep2 { nest: Deep1; }
struct Deep3 { nest: Deep2; }

contract TestContract {
  deep: Deep3;

  init() {
    self.deep = Deep3{ nest: Deep2{ nest: Deep1{ val: 42 } } };
  }
}