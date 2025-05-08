contract MixedOptionalNonOptional {
    a: Int?;
    b: Int = 1;
    c: String?;
    d: String = "x";

    init() {
        self.a = 42;
        self.b = 2;
        self.c = "hi";
        self.d = "bye";
    }
}