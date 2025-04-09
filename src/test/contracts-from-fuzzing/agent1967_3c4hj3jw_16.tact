struct A {
    s: B;
}

struct B {
    foo: Int;
    bar: C;
}

struct C {
    baz: D;
}

struct D {
    v: Int;
    w: Bool;
    u: String;
    t: Address;
}

contract TestContract {
    top: A;

    init() {
        self.top = A{
            s: B{
                foo: 42,
                bar: C{
                    baz: D{
                        v: 1,
                        w: false,
                        u: "nest",
                        t: myAddress()
                    }
                }
            }
        };
    }
}