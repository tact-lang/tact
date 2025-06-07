struct InnerOptional {
    val: Int?;
}

contract OptionalInsideStruct {
    inner: InnerOptional;

    init() {
        self.inner = InnerOptional{ val: null };
    }
}