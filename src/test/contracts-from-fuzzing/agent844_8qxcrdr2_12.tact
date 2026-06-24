contract AllOptionalSimple {
    a: Int?;
    b: Bool?;
    c: String?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }

    receive() {
        let _ = self.a;
        let _ = self.b;
        let _ = self.c;
    }
}
