struct InnerStr {
    data: String?;
}

contract NullInnerString {
    val: InnerStr;

    init() {
        self.val = InnerStr{ data: null };
    }
}