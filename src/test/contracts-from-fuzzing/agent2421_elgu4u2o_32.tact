contract FieldCombination {
    a: Int = 1;
    b: Bool;
    c: Int? = null;
    d: Bool? = null;
    e: String = "hello";
    f: String? = null;

    init() {
        self.b = true;
        self.e = "world";
    }
}