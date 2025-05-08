struct MultiNest {
    a: Int;
    b: Second;
}

struct Second {
    c: Int;
    d: Third;
}

struct Third {
    e: Int;
    f: Fourth;
}

struct Fourth {
    g: Int;
}

contract DeepNestTest {
    s: MultiNest;

    init() {
        self.s = MultiNest{
            a:1,
            b:Second{
                c:2,
                d:Third{
                    e:3,
                    f:Fourth{
                        g:4
                    }
                }
            }
        };
    }
}
