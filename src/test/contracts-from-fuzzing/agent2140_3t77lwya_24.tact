contract Defaults {
    a: Int = 42;
    b: Bool = true;
    c: String = "test";

    init() {
        self.a = 100;
        self.b = false;
        self.c = "changed";
    }
}
