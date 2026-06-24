struct Complex {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool? = true;
    e: String = "hi";
    f: String?;
    g: Bool = false;
    h: Int? = 123;
    i: String? = "yo";
    j: Bool?;
}

contract BigStructStorage {
    cfg: Complex;

    init() {
        self.cfg = Complex{
            a: 1,
            b: null,
            c: false,
            f: null,
            j: null,
        };
    }
}