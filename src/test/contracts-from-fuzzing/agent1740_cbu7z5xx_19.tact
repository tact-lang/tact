contract EmptyDefaultsPartialInit {
    x: Int = 5;
    y: Bool;

    init() {
        self.y = true;
    }
}