struct NestedStruct {
    inner: Int?;
}

contract NestedOptionalStruct {
    data: NestedStruct?;

    init() {
        self.data = null;
    }
}
