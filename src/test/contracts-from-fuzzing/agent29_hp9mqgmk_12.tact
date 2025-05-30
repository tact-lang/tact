contract MixedFields {
    a: Int;
    b: Int = 5;
    c: Int;
    init() {
        self.a = 1;
        self.c = 2;
    }
}