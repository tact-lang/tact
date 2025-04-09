struct A { a: Int; }
struct B { b: Int; }
struct C { c: Int; }
struct D { d: Int; }
struct E { e: Int; }
struct F { f: Int; }
struct G { g: Int; }
struct H { h: Int; }

struct Nest {
  a: A;
  b: B;
  c: C;
  d: D;
  e: E;
  f: F;
  g: G;
  h: H;
}

contract Test {
    x: Nest;
    
    init() {
        self.x = Nest{
            a: A{a:1},
            b: B{b:2},
            c: C{c:3},
            d: D{d:4},
            e: E{e:5},
            f: F{f:6},
            g: G{g:7},
            h: H{h:8}
        };
    }
}