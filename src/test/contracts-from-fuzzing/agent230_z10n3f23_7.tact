struct NestedOptional {
    innerOpt: Int?;
}

contract OptionalStructField {
    maybeStruct: NestedOptional?;

    init() {
        self.maybeStruct = null;
    }
}
