contract DefaultAndInitMix {
    x: Int = 5;
    y: Bool;

    init() {
        self.y = true;
        self.x = 123; // overrides default
    }
}