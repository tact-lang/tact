struct A {
    b: B;
}

struct B {
    c: C;
}

struct C {
    d: D;
}

struct D {
    e: E;
}

struct E {
    f: F;
}

struct F {
    val: Int;
}

contract SuperChain {
    deepVal: A;

    init() {
        self.deepVal = A {
            b: B {
                c: C {
                    d: D {
                        e: E {
                            f: F { val: 314 }
                        }
                    }
                }
            }
        };
    }

    receive() {
        let _ = self.deepVal.b.c.d.e.f.val;
    }
}