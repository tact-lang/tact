struct Deep1 { val: Int; }
struct Deep2 { nested: Deep1; }
struct Deep3 { nested: Deep2; }
struct Deep4 { nested: Deep3; }

contract TestContract {
  deep: Deep4;

  init() {
    self.deep = Deep4{ nested: Deep3{ nested: Deep2{ nested: Deep1{ val: 7 }}}};
  }
}