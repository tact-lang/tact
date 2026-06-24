struct OneOptionalInner {
    inner: InnerOption?;
}

struct InnerOption {
    val: Int;
}

contract TestContract {
    data: OneOptionalInner;

    init() {
        self.data = OneOptionalInner{
            inner: InnerOption{ val: 42 }
        };
    }
}