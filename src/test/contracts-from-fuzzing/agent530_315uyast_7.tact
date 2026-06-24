struct A { i: Int; }
struct B { a: A; }
struct C { b: B; }
struct D { c: C; }
struct E { d: D; }
struct F { e: E; }

contract DeepChain {
    f: F;

    init() {
        self.f = F{
            e: E{
                d: D{
                    c: C{
                        b: B{
                            a: A{ i: 7 }
                        }
                    }
                }
            }
        };
    }
}