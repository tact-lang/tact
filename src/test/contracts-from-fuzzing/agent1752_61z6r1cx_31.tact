contract DefaultVsInitOrder {
    x: Int = 1;
    y: Int;

    init() {
        self.x = 42; // override default
        self.y = 100;
    }
}