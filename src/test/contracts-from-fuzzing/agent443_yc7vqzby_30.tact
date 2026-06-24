contract PartialInitDefault {
    x: Int;
    y: Bool = true;

    init() {
        self.x = 15;
    }
}