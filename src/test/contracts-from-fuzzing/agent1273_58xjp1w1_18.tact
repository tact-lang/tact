contract MixedTypesDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hello";

    init() {
        self.a = 2;
        self.b = false;
        self.c = "hi";
    }
}