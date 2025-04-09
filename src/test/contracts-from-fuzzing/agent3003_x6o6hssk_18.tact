struct ContainsOption {
    inner: Int?;
}

contract OuterContainsOptionalStruct {
    val: ContainsOption?;

    init() {
        self.val = null;
    }
}
