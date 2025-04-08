struct DeepOptionalStruct {
    inner: Int?;
}

contract NestedOptionalStruct {
    outer: DeepOptionalStruct?;

    init() {
        self.outer = null;
    }
}