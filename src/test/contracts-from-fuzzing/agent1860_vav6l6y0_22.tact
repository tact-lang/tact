contract InitializedInInit {
    a: Int;
    b: Bool;
    s: String;

    init() {
        self.a = 10;
        self.b = true;
        self.s = "abcdef";
    }
}