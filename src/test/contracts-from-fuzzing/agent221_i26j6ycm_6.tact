contract ManyPrimitiveFields {
    a: Int = 1;
    b: Bool = false;
    c: String = "hello";

    init() {
        self.a = 42;
        self.b = true;
        self.c = "world";
    }
}