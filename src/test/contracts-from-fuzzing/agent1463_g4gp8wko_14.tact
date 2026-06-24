contract ManyPersistents {
    i: Int = 1;
    b: Bool = false;
    s: String = "hi";
    io: Int? = null;
    bo: Bool? = null;
    so: String? = null;

    init() {
        self.i = 42;
        self.b = true;
        self.s = "hello";
        self.io = 100;
        self.bo = false;
        self.so = "yes";
    }
}
