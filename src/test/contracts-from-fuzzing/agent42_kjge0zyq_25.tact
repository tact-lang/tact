struct D {
    v: Int?;
    w: String;
}
struct C {
    d: D?;
    t: String;
}
struct B {
    c: C;
    num: Int?;
}
struct A {
    b: B?;
    flag: Bool;
}

contract OmitLayers {
    s: A;

    init() {
        self.s = A{
            b: B{
                c: C{
                    d: null,
                    t: "hi"
                },
                num: null
            },
            flag: true
        };
    }
}