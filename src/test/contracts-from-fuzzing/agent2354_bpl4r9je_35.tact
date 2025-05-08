contract OverwriteInInit {
    x: Int = 1;
    y: Bool = false;

    init() {
        self.x = 0;
        self.y = true;
    }
}