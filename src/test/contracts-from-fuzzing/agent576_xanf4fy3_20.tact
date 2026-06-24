contract OverrideDefault {
    count: Int = 5;

    init() {
        self.count = 42;
    }
}
