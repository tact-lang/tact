struct Sub {
    x: Int;
}

contract ManyOptionals {
    a: Sub?;
    b: Int?;
    c: Bool?;
    d: String?;
    e: Slice?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
    }
}
