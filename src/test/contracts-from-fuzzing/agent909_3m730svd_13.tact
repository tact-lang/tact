contract ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;

    init() {
        self.a = null;
        self.b = true;
        self.c = 42;
        self.d = null;
    }
}