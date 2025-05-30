contract TestContract {
    s: String?;
    b: Bool;
    i: Int;

    init() {
        self.b = true;
        self.i = 42;
        // omit initializing optional s
    }
}