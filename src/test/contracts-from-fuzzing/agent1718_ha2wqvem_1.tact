contract SingleOptionalField {
    optInt: Int?;

    init() {
        self.optInt = null;
    }

    receive() {
        // Access to ensure usage
        if (self.optInt != null) {
            let _ = self.optInt!!;
        }
    }
}