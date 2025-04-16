struct AOpt {
    a: Int?;
}

contract DefOptMix {
    a: Int = 0;
    b: Int?;
    c: Bool = false;
    d: Bool?;
    e: String = "a";
    f: String?;
    g: AOpt?;

    init() {
        self.b = null;
        self.d = null;
        self.f = null;
        self.g = null;
    }
}
