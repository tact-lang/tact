struct A { a: Int; }
struct B { a: A; }
struct C { a: B; }
struct D { a: C; }
struct E { a: D; }
struct F { a: E; }
struct G { a: F; }
struct H { a: G; }
struct I { a: H; }

contract LongChain {
    data: I;

    init() {
        self.data = I{
            a: H{
                a: G{
                    a: F{
                        a: E{
                            a: D{
                                a: C{
                                    a: B{
                                        a: A{a: 404}
                                    }
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}