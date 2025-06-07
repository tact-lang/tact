contract OutOfOrderInit {
    a: Int;
    b: Bool = false;

    init() {
        self.b = true;
        self.a = 123;
    }
}