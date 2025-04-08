contract OverwriteInit {
    x: Int = 5;
    y: Bool = true;

    init() {
        self.x = 10;
        self.y = false;
    }
}