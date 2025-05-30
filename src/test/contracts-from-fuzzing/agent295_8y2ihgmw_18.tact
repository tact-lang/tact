struct D {
    w: String;
    z: Int;
}

struct C {
    x: Int?;
    y: Bool;
    embedded: D;
}

struct B {
    c: C;
    f: Bool?;
}

struct A {
    b: B;
    s: String?;
    num: Int;
}

contract MultiLayerComplex {
    state: A;

    init() {
        self.state = A{
            b: B{
                c: C{
                    x: null,
                    y: true,
                    embedded: D{
                        w: "wow",
                        z: 7
                    }
                },
                f: null
            },
            s: null,
            num: 123
        };
    }
}