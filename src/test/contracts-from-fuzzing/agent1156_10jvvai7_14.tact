contract FieldDefaultValues {
    a: Int = 100;
    b: Bool = false;
    c: String = "abc";

    init() {
        self.a = 200;
        self.b = true;
        self.c = "xyz";
    }
}