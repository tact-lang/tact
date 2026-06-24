struct A {
    x: Int;
    y: String;
}
struct B {
    a: A;
    z: Bool;
}
struct C {
    b: B;
    num: Int;
}
struct D {
    c: C;
    txt: String;
}

contract DeeplyNested {
    d: D;
    init() {
        self.d = D{
            c: C{
                b: B{ a: A{ x: 1, y: "y" }, z: false },
                num: 42
            },
            txt: "end"
        };
    }
}