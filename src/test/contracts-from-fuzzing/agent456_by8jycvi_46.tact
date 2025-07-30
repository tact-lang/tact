struct VeryDeep {
    a: A;
}

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
    val: Int;
}

contract VeryDeepContract {
    deep: VeryDeep;

    init() {
        self.deep = VeryDeep{
            a: A{
                b: B{
                    c: C{
                        d: D{
                            e: E{ val: 42 }
                        }
                    }
                }
            }
        };
    }
}