struct Mid {
    x: Int;
    y: String?;
    z: Bool;
}

contract MultiOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Mid?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}
