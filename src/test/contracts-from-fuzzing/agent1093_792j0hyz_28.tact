contract MixedOptionDefault {
    a: Int? = null;
    b: Bool = true;
    c: String? = null;

    init() {
        self.a = 42;
        self.c = "foo";
    }
}