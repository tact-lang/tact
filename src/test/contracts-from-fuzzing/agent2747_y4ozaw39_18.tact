contract InitDefaults {
    x: Int = 3;
    y: Int;
    s: String = "hey";

    init() {
        self.y = 4;
        self.s = "hello";
    }
}