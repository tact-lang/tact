struct A { v: Int }
struct B { a: A? }
struct C { b: B? }

contract Test14 {
    c: C;

    init() {
        self.c = C{
            b: B{
                a: A{
                    v: 9
                }
            }
        };
    }
}