struct Child {
    x: Int;
    y: Int;
}

contract MultiOption {
    a: Int?;
    b: Child?;
    c: String?;
    d: Bool?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}