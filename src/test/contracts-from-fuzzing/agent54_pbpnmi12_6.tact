struct OptionalOuter {
    nestedOpt: Int?;
}

contract OptionalOnOptional {
    field: OptionalOuter?;

    init() {
        self.field = null;
    }
}