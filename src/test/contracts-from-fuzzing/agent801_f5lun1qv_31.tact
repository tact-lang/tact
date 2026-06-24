contract ManyDefaultsPrimitives {
    a: Int = 11;
    b: Bool = true;
    c: Int = 22;
    d: Bool = false;
    e: Int?;
    f: Bool?;

    init() {
        self.e = 33;
        self.f = null;
    }
}