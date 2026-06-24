contract OverlappingInitializers {
    x: Int = 1;
    y: Bool;

    init() {
        self.y = true;
        self.x = 42;
    }
}