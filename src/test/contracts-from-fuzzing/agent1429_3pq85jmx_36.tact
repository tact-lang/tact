struct DeepNestedOpt {
    inner: Int?;
}

contract DeepOpt {
    val: DeepNestedOpt?;

    init() {
        self.val = null;
    }
}