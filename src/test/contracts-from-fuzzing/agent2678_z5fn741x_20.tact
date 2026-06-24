contract OptionalContractRef {
    data: Address?;

    init() {
        self.data = null;
    }
}