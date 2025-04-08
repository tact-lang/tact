struct A { p: Int; }
struct B { q: A; }
struct C { r: B; }
struct D { s: C; }

contract ChainNested {
    d: D;

    init() {
        self.d = D{
            s: C{
                r: B{
                    q: A{
                        p: 1
                    }
                }
            }
        };
    }
}