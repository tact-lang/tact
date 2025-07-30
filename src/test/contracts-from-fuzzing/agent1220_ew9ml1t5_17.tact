contract DefaultPersistentVals {
    a: Int = 5;
    b: Bool = true;
    c: String = "ok";

    init() {
        self.a = 42;
        self.b = false;
        self.c = "changed";
    }
}