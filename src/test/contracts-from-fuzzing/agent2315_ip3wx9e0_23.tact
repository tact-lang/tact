contract DefaultsVsInit {
    x: Int = 1;
    y: Bool = true;
    s: String = "default";

    init() {
        self.x = 42;
        self.y = false;
        self.s = "override";
    }
}