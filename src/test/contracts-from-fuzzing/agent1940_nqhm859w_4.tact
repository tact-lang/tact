struct NestedOptional {
    val: Bool?;
    txt: String?;
}

contract OptionalStructFields {
    inner: NestedOptional?;

    init() {
        self.inner = NestedOptional{ val:true, txt:null };
    }
}