contract BadOrderInit {
    x: Int;
    y: Bool;
    s: String;

    init() {
        self.y = true;
        self.s = "abc";
        self.x = 42;
    }
}