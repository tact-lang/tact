struct NestedOpt {
    inner: Int?;
}

contract OptStruct {
    val: NestedOpt?;

    init() {
        self.val = null;
    }
}