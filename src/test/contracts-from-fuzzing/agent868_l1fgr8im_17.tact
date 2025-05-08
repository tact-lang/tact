struct A { ai: Int }
struct B { bi: Int; a: A }
struct C { ci: Int; b: B }
struct D { di: Int; c: C }

contract TestContract {
    df: D;

    init() {
        self.df = D{
            di: 9,
            c: C{
                ci: 8,
                b: B{
                    bi: 7,
                    a: A{ ai: 6 }
                }
            }
        };
    }

    receive() {}
}