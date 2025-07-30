struct A { b: B; }
struct B { c: C; }
struct C { d: D; }
struct D { e: E; }
struct E { f: F; }
struct F { g: G; }
struct G { h: H; }
struct H { i: I; }
struct I { x: String; y: Bool; }

contract SuperDeepNest {
    s: A;

    init() {
        self.s = A{
            b: B{
                c: C{
                    d: D{
                        e: E{
                            f: F{
                                g: G{
                                    h: H{
                                        i: I{
                                            x: "ok",
                                            y: true
                                        }
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