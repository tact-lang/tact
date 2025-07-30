struct NestedOptionalStruct {
    inner: Int?;
}

contract NestedOptionalInContract {
    data: NestedOptionalStruct?;

    init() {
        self.data = null;
    }
}