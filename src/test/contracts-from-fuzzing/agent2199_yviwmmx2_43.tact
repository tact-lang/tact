contract PartialDefaults {
    a: Int;
    b: Bool = true;
    c: String;
    init() {
        self.a = 1;
        self.c = "hi";
    }
}
