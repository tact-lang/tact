struct A { n: Int; }
struct B { a: A; }
struct C { b: B; }
struct D { c: C; }
struct E { d: D; }

contract FiveLayers {
    e: E;

    init() {
        self.e = E{
            d: D{
                c: C{
                    b: B{
                        a: A{ n: 7 }
                    }
                }
            }
        };
    }
}
