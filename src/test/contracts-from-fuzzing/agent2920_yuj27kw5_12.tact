struct A {
    a: Int;
}

struct B {
    b: Int;
    a: A;
}

struct C {
    c: Int;
    b: B;
}

struct D {
    d: Int;
    c: C;
}

struct E {
    e: Int;
    d: D;
}

contract ABCDE {
    store: E;

    init() {
        self.store = E{
            e:5,
            d: D{
                d:4,
                c: C{
                    c:3,
                    b: B{
                        b:2,
                        a: A{a:1}
                    }
                }
            }
        };
    }
}