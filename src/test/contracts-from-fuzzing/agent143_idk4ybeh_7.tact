contract InitDefaults {
    int1: Int = 42;
    int2: Int;
    bool1: Bool = true;
    bool2: Bool;
    text: String = "hello";

    init() {
        self.int2 = 7;
        self.bool2 = false;
    }
}