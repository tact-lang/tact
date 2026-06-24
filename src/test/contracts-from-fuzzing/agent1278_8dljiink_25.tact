struct A { a: Int; }
struct B { a: A; }
struct C { b: B; }
struct D { c: C; }
struct E { d: D; }
struct F { e: E; }

contract TestContract {
    nested: F;

    init() {
        self.nested = F{
            e: E{
                d: D{
                    c: C{
                        b: B{
                            a: A{
                                a: 42,
                            },
                        },
                    },
                },
            },
        };
    }
}