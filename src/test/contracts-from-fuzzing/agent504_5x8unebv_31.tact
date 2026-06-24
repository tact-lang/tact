contract ManyDefaultsOptPrim {
    a: Int? = null;
    b: Bool? = false;
    c: Address? = null;
    d: Cell? = null;
    e: Slice? = null;
    f: String? = null;

    init() {
        self.a = null;
        self.b = false;
        self.c = null;
        self.d = null;
        self.e = null;
        self.f = null;
    }

    receive() {
        let _ = self.a;
    }
}