contract UninitializedNoDefault {
    x: Int;
    y: Bool;
    s: String;

    init() {
        self.x = 10;
        self.y = true;
        self.s = "abc";
    }
}