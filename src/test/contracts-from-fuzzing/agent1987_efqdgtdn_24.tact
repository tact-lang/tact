struct Complex {
    i: Int;
    b: Bool;
    s: String;
    opti: Int?;
    strct: Nested;
}

struct Nested {
    f1: Int;
    f2: String?;
    f3: Bool = true;
}

contract ComplexNested {
    c: Complex;
    init() {
        self.c = Complex{
            i: 1,
            b: false,
            s: "hi",
            opti: null,
            strct: Nested{f1:2}
        };
    }
}