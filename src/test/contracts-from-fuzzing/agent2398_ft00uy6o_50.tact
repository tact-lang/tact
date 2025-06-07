contract BuilderInState {
    b: Builder;

    init() {
        self.b = beginCell();
    }
}