contract OnlyDefaults {
    x: Int = 0;
    y: String = "";
    b: Bool = false;

    init() {
        self.x = 1;
        self.y = "y";
        self.b = true;
    }
}