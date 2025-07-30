struct A { f1: Int; f2: Bool; f3: String; }
struct B { g1: Int; g2: A; }
struct C { h1: B; h2: A; h3: Bool; }

contract ManyStructs{
  x: A = A{ f1: 1, f2: false, f3: "a" };
  y: B = B{ g1: 2, g2: A{ f1: 3, f2: true, f3: "b" } };
  z: C = C{
    h1: B{ g1: 4, g2: A{ f1: 5, f2: true, f3: "c" } },
    h2: A{ f1: 6, f2: false, f3: "d" },
    h3: true
  };

  init(){
    self.x = A{ f1: 11, f2: true, f3: "xx" };
    self.y = B{ g1: 22, g2: A{ f1: 33, f2: false, f3: "yy" } };
    self.z = C{
      h1: B{ g1: 44, g2: A{ f1: 55, f2: true, f3: "zz" } },
      h2: A{ f1: 66, f2: false, f3: "ww" },
      h3: false
    };
  }
}