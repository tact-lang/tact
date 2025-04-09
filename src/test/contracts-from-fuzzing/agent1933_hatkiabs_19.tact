struct Complex {
    i: Int;
    b: Bool;
    s: String;
    oi: Int?;
    ob: Bool?;
    os: String?;
}

contract ComplexOpt {
    c: Complex?;

    init() {
        self.c = null;
    }
}