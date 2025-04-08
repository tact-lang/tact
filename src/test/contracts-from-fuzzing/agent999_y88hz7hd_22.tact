contract OptDefaultsMix {
    x: Int? = null;
    y: Bool? = false;
    s: String? = "hello";

    init() {
        self.x = 3;
        self.y = true;
        self.s = "world";
    }
}