contract ChainInit {
    a: Int;
    b: Bool;
    c: String;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hello";
        self.a = 42;
        self.b = false;
        self.c = "world";
    }
}