contract BuilderFieldContract {
    b: Builder;

    init() {
        self.b = beginCell();
    }
}