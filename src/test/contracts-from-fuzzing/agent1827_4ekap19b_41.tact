contract LargeStrConst {
    const LONG_CONST: String = "This is a very long constant that we want to test inside a contract, maybe it will help us.";

    longField: String;

    init() {
        self.longField = self.LONG_CONST;
    }
}