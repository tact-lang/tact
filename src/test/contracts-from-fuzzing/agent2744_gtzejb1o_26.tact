struct StringInner {
    val: String;
}

contract InlineStringStruct {
    inner: StringInner;

    init() {
        self.inner = StringInner{
            val: "hi"
        };
    }
}
