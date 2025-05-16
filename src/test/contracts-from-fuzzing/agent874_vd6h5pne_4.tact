contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: String = "x";
    d: Int?;
    e: Bool?;
    f: String?;

    init() {
        self.d = 42;
        self.e = null;
        self.f = "optional string";
    }
}
