contract MultiBuilder {
    b1: Builder;
    b2: Builder;
    b3: Builder;
    init() {
        self.b1 = beginCell();
        self.b2 = beginCell();
        self.b3 = beginCell();
    }
    receive() {}
}