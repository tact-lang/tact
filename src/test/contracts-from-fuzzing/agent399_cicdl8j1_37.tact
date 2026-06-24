contract OverrideDefaultsInInit {
    x: Int = 4;
    y: Bool = true;
    s: String = "start";

    init() {
        self.x = 10;
        self.y = false;
        self.s = "end";
    }
}