struct A {
    a: Int;
    b: B;
}
struct B {
    c: Int;
    d: C;
}
struct C {
    e: Int;
    f: D;
}
struct D {
    g: Int;
    h: E;
}
struct E {
    i: Int;
    j: F;
}
struct F {
    k: Int;
}

contract Test {
    nested: A;
    init() {
        self.nested = A{
            a:1,
            b:B{
                c:2,
                d:C{
                   e:3,
                   f:D{
                      g:4,
                      h:E{
                         i:5,
                         j:F{ k:6 }
                      }
                   }
                }
            }
        };
    }
}