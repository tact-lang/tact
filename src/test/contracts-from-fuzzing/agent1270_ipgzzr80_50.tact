contract OverwriteInit {
    a: Int = 5;
    b: Bool = false;

    init() {
        self.a = 42;
        self.b = true;
    }
}