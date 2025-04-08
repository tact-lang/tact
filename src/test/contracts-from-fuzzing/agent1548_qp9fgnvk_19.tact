contract Messy {
    a: Int = 1;
    b: Bool;
    c: String = "abc";
    d: Int?;
    e: Bool?;
    f: String?;

    init() {
        self.b = true;
        self.d = 42;
        self.e = null;
        self.f = null;
    }
}