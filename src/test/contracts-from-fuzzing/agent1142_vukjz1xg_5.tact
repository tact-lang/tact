struct OptionalNest {
    innerOpt: Bool?;
}

contract OptionalStructField {
    maybe: OptionalNest?;

    init() {
        self.maybe = null;
    }
}