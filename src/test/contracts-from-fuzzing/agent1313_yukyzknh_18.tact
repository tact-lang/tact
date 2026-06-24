struct Deep1 { f: Int; }
struct Deep2 { f: Deep1; }
struct Deep3 { f: Deep2; }
struct Deep4 { f: Deep3; }

contract MaxDepth {
  s: Deep4;

  init() {
    self.s = Deep4{
      f: Deep3{
        f: Deep2{
          f: Deep1{
            f: 77
          }
        }
      }
    };
  }
}