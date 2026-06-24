struct InnerOptional {
    val: Int?;
}

contract OptionInStruct {
    inner: InnerOptional;

    init() {
        self.inner = InnerOptional{ val: null };
    }
}