struct Inner {
    a: Int;
    b: String?;
}

contract NestedOptionalStruct {
    val: Inner?;

    init() {
        self.val = null;
    }
}
