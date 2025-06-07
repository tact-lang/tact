struct A { a: Int; }
struct B { b: Int; a: A; }
struct C { c: Int; b: B; }
struct D { d: Int; c: C; }

contract TestContract {
    deep: D;

    init() {
        self.deep = D{
            d: 1,
            c: C{
                c: 2,
                b: B{
                    b: 3,
                    a: A{
                        a: 4
                    }
                }
            }
        };
    }
}