struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract Test {
    c: Complex;

    init() {
        self.c = Complex{a: 1, b: true, c: "c", d: null, e: null, f: null};
    }
}