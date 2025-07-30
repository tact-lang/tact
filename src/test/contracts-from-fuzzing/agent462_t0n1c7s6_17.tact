struct A { b: B; }
struct B { c: C; }
struct C { d: D; }
struct D { e: E; }
struct E { f: F; }
struct F { g: G; }
struct G { val: Int; }

contract DeepManyLevel {
    root: A;

    init() {
        self.root = A{
            b: B{
                c: C{
                    d: D{
                        e: E{
                            f: F{
                                g: G{
                                    val: 999
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}