struct A {
    a: Int; 
    b: Bool;
}

struct B {
    c: A;
    d: String;
    e: Int?;
}

struct C {
    f: B;
    g: Cell?;
    h: Bool?;
}

contract NestedMix {
    x: C;

    init() {
        self.x = C{
            f: B{
                c: A{
                    a: 5,
                    b: false,
                },
                d: "Hello",
                e: null,
            },
            g: null,
            h: true,
        };
    }
}