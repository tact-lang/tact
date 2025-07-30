struct SInner {
  a: Int;
}

struct SMid1 {
  s: SInner;
}

struct SMid2 {
  s: SMid1;
}

struct SMid3 {
  s: SMid2;
}

struct SRoot {
  s: SMid3;
}

contract DeepNesting {
  root: SRoot;

  init() {
    self.root = SRoot{
      s: SMid3{
        s: SMid2{
          s: SMid1{
            s: SInner{ a: 555 }
          }
        }
      }
    };
  }
}
