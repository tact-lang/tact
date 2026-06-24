struct A { a: Int; }
struct B { b: Int; sub: A; }
struct C { c: Int; sub: B; }
struct D { d: Int; sub: C; }
struct E { e: Int; sub: D; }

contract FiveLayerDeep {
    data: E;

    init() {
        self.data = E{
            e: 5,
            sub: D{
                d: 4,
                sub: C{
                    c: 3,
                    sub: B{
                        b: 2,
                        sub: A{
                            a: 1,
                        },
                    },
                },
            }
        };
    }
}