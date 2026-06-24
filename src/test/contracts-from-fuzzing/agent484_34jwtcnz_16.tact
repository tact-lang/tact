struct InnerOptional {
    val: Int?;
}

contract InlineInnerOptional {
    inner: InnerOptional;
    flag: Bool;

    init() {
        self.inner = InnerOptional { val: null };
        self.flag = true;
    }
}