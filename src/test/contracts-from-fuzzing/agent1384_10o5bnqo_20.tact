contract PartialDefaults {
    a: Int;
    b: Bool = true;
    c: String = "X";

    init() {
        self.a = 99;
    }
}