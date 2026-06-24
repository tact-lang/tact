contract Test {
    const DEF: Int = 999;
    x: Int = self.DEF;

    init() {
        self.x = 42;
    }
}