contract DefaultAndInit {
    a: Int = 10;
    b: Bool = false;
    c: String = "hi";

    init() {
        self.a = 20;
        self.b = true;
        self.c = "bye";
    }
}