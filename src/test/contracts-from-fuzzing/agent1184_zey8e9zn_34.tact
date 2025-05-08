contract DefaultedBools {
    x: Bool = true;
    y: Bool = false;

    init() {
        self.x = false;
        self.y = true;
    }
}