struct NestedOptionalStruct {
    innerOpt: Int?;
}

contract DoubleNestedOptional {
    nestedOpt: NestedOptionalStruct?;
    init() {
        self.nestedOpt = null;
    }
}