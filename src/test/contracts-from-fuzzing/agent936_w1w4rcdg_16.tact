contract OptionalAndDefault {
    a: Int = 5;
    b: Int?;
    c: Bool = true;
    d: Bool?;

    init() {
        self.b = null;
        self.d = null;
    }

    receive() {
        let _ = self.a;
        let _ = self.b;
        let _ = self.c;
        let _ = self.d;
    }
}