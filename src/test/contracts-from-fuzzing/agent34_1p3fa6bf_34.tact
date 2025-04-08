contract Test33 {
    b: Builder;
    init() {
        self.b = beginCell().storeInt(1, 8);
    }
}