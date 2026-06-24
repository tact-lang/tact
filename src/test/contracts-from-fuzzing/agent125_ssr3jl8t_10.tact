contract ZeroInitFields {
    a: Int;
    b: Bool;

    init() {
        self.a = 0;
        self.b = false;
    }
}