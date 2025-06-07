contract LazyNoInit {
    a: Int;
    b: Bool;
    init() {
        self.a = 7;
        self.b = true;
    }
}