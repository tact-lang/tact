struct RecursiveWrap {
    inner: InnerWrap?;
}

struct InnerWrap {
    val: Int = 123;
}

contract TestContract {
    wrap: RecursiveWrap = RecursiveWrap{};
    init() {}
    receive() {}
}