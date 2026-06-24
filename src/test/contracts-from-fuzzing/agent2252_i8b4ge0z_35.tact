contract OptionalContractRef {
    ref: StateInit?;
    init() {
        self.ref = null;
    }
}