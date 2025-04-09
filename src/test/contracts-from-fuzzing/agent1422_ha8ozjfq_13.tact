struct A {
    ai: Int;
}

struct B {
    bi: Int;
    a: A;
}

struct C {
    ci: Int;
    b: B;
}

struct D {
    di: Int;
    c: C;
}

struct E {
    ei: Int;
    d: D;
}

contract Layers {
    e: E;

    init() {
        self.e = E{
            ei: 5,
            d: D{
                di: 4,
                c: C{
                    ci:3,
                    b: B{
                        bi: 2,
                        a: A{ ai:1 },
                    }
                }
            }
        };
    }
}