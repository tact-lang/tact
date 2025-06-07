struct Content {
    flag: Bool;
    data: String;
}

contract OptionalMixed {
    a: Int?;
    b: Bool?;
    c: Content?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}