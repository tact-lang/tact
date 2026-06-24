struct NestedOpt {
    inner: Int?;
}

contract OptNestedInStruct {
    val: NestedOpt;

    init() {
        self.val = NestedOpt{
            inner: null
        };
    }
}
