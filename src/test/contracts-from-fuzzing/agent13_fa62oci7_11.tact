struct OptOpt {
    inner: Int?;
}

contract DoubleOptional {
    field: OptOpt?;

    init() {
        self.field = null;
    }
}