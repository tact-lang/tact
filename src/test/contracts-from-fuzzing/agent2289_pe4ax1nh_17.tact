struct Data {
    s: String;
    n: Int?;
}

contract OnlyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Data?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}