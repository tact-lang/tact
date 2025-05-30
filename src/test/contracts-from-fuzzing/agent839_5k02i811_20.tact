struct NestedOpt {
    inner: Int?;
}

contract NestedOptionalStruct {
    val: NestedOpt?;
    init() {
        self.val = null;
    }
}