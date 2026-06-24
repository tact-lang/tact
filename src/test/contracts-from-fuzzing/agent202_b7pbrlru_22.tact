contract MultipleBoolOpt {
    a: Bool?;
    b: Bool?;
    c: Bool?;
    d: Bool?;

    init() {
        self.a = true;
        self.b = false;
        self.c = null;
        self.d = null;
    }

    receive() {
        if (self.c == null) {
            self.c = true;
        }
    }
}