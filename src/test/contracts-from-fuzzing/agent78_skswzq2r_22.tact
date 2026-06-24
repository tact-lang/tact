struct Optionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalsAsRoot {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Optionals?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}