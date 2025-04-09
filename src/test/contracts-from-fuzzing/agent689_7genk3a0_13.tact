struct InnerDefaultOpt {
    val: Int?;
}

contract InitInnerOptNull {
    inner: InnerDefaultOpt;
    init() {
        self.inner = InnerDefaultOpt{
            val: null
        };
    }
}