contract TestContract {
    s: String = "foo";
    b: Bool = true;

    init() {
        self.s = "bar";
        self.b = false;
    }
}