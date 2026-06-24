contract InitWithPartialDefault {
    x: Int;
    y: Bool = true;

    init() {
        self.x = 99;
    }
}
