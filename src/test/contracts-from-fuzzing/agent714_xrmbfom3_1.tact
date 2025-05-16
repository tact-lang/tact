contract SingleOptionalField {
    opt: Int?;

    init() {
        self.opt = null;
    }

    receive() {
        // no-op
    }
}