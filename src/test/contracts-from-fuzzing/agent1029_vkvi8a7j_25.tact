contract OutOfOrderInit {
    a: Int;
    b: Bool;
    c: String;

    init() {
        self.c = "hello";
        self.b = true;
        self.a = 42;
    }
}