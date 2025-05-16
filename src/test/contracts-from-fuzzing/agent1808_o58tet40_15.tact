struct A {
  f1: Int;
  f2: Bool;
}

struct B {
  s1: A;
  s2: A;
}

struct C {
  s1: B;
  s2: B;
}

struct D {
  s1: C;
  s2: C;
}

contract DeepWide {
  data: D;

  init() {
    self.data = D{
      s1: C{
        s1: B{ s1: A{f1:1,f2:true}, s2: A{f1:2,f2:false} },
        s2: B{ s1: A{f1:3,f2:true}, s2: A{f1:4,f2:false} }
      },
      s2: C{
        s1: B{ s1: A{f1:5,f2:true}, s2: A{f1:6,f2:false} },
        s2: B{ s1: A{f1:7,f2:true}, s2: A{f1:8,f2:false} }
      }
    };
  }
}