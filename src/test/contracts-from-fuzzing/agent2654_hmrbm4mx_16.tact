contract MixedTypeDefaults {
    a: Int = 5;
    b: Bool = true;
    s: String = "abc";
    opt: Int?;

    init() {
        self.a = 10;
        self.b = false;
        self.s = "xyz";
        self.opt = null;
    }
}