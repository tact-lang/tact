contract InitManyOptionals {
    a: Int?;
    b: Int?;
    c: String?;
    d: Bool?;
    e: Bool;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = true;
    }
}
