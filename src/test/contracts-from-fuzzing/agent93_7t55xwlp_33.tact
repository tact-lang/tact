contract NestedDefaultsInit {
    a: Int = 1;
    b: String;
    c: Bool = false;

    init() {
        self.b = "set";
    }
}