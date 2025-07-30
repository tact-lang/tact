contract Defaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "hello";
    d: Int? = null;
    e: Bool? = null;

    init() {
        self.a = 42;
        self.b = false;
        self.c = "world";
        self.d = null;
        self.e = true;
    }
}