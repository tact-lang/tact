struct A { x: Int }
struct B { a: A }
struct C { b: B }
struct D { c: C }
struct E { d: D }
struct F { e: E }
struct G { f: F }

contract DeepChain {
    data: G;

    init() {
        self.data = G{
            f: F{
                e: E{
                    d: D{
                        c: C{
                            b: B{ a: A{ x: 123 } }
                        }
                    }
                }
            }
        };
    }
}