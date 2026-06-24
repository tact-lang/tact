struct Chain {
 a: A;
}

struct A {
 b: B;
}

struct B {
 c: C;
}

struct C {
 d: D;
}

struct D {
 e: Int?;
 f: Bool?;
 g: String?;
}

contract TestContract {
  z: Chain;

  init() {
    self.z = Chain{
      a: A{
        b: B{
          c: C{
            d: D{ e:null, f:null, g:null }
          }
        }
      }
    };
  }
}