contract BuilderMixContract {
    a: Builder;
    b: Builder?;

    init() {
        self.a = beginCell();
        self.b = null;
    }
}