struct Deep1 { f: Int; }
struct Deep2 { f: Deep1; }
struct Deep3 { f: Deep2; }
struct Deep4 { f: Deep3; }
struct Deep5 { f: Deep4; }
struct Deep6 { f: Deep5; }
struct Deep7 { f: Deep6; }
struct Deep8 { f: Deep7; }

contract DeepNestingContract {
  d: Deep8;
  init() {
    self.d = Deep8{ f: Deep7{ f: Deep6{ f: Deep5{ f: Deep4{ f: Deep3{ f: Deep2{ f: Deep1{ f: 42 } } } } } } } };
  }
}
