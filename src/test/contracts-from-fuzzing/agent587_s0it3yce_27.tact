contract DefaultsAndOpts {
    a: Int = 0;
    b: Int? = null;
    c: Bool = false;
    d: Bool? = null;
    init() {
        self.a = 1;
        self.b = null;
        self.c = true;
        self.d = null;
    }
    receive() {
        let _ = self.a;
    }
}