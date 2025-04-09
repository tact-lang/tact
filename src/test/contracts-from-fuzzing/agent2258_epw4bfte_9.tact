contract OptionalFieldsCombo {
    ai: Int? = null;
    ab: Bool? = null;
    // misplaced optional field caused parse error previously
    receive() {
        let _ = self.ai;
    }
}