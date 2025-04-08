contract SparseInitDefaults {
    a: Int = 0;
    b: Bool;
    c: String = "default";
    d: Int?;
    e: Bool?;

    init() {
        self.b = true;
        self.d = null;
        self.e = null;
    }

    receive() {
        let _ = self.a;
        let _ = self.b;
        let _ = self.c;
        let _ = self.d;
        let _ = self.e;
    }
}
