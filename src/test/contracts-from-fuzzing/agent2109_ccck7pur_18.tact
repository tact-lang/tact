struct InnerOpt {
    val: Int?;
}

contract OptInStruct {
    inner: InnerOpt;

    init() {
        self.inner = InnerOpt{ val: null };
    }
}