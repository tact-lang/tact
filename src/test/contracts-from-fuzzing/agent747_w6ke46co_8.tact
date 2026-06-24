contract TestContract {
    multiNest: A;

    init() {
        self.multiNest = A{
            b: B{
                c: C{
                    d: D{
                        value: 999
                    }
                }
            }
        };
    }
}

struct A { b: B; }
struct B { c: C; }
struct C { d: D; }
struct D { value: Int; }
