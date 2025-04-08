contract OverInit {
    a: Int;
    b: Bool;
    c: String;

    init() {
        self.a = 5;
        self.b = true;
        self.c = "abc";
        self.a = 10;
        self.b = false;
        self.c = "def";
    }
}
