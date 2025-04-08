contract ContractWithBuilder {
    b: Builder;

    init() {
        self.b = beginCell();
    }
}