contract ReorderPersistent {
    a: Int as uint8 = 1;
    b: Int = 2;
    c: Int as uint8 = 3;

    init() {
        self.a = 11;
        self.b = 22;
        self.c = 33;
    }

    receive() {
        let _ = self.a;
        let _ = self.b;
        let _ = self.c;
    }
}