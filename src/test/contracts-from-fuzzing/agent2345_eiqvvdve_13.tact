struct A { val: Int }
struct B { a: A }
struct C { b: B }
struct D { c: C }
struct E { d: D }

contract DeepChain {
    e: E;

    init() {
        self.e = E{
            d: D{
                c: C{
                    b: B{
                        a: A{ val: 1 }
                    }
                }
            }
        };
    }
}
