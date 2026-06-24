contract DefaultBuilder {
    b: Builder;

    init() {
        self.b = beginCell();
    }
}