contract Test {
    b: Builder?;

    init() {
        self.b = beginCell();
    }
}