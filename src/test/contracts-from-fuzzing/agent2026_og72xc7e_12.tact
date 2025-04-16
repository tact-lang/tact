struct HasOptionalInner {
    inner: Inner?;
}

struct Inner {
    intField: Int;
    strField: String;
}

contract TestContract {
    data: HasOptionalInner;

    init() {
        self.data = HasOptionalInner{
            inner: null
        };
    }
}