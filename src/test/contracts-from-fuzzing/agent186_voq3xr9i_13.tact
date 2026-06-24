contract DirectOptionalAssign {
    optInt: Int?;

    init() {
        self.optInt = 123;
        self.optInt = null;
        self.optInt = 456;
    }
}