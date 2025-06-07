struct OptionalInner {
    inner: Inner?;
}

struct Inner {
    a: Int?;
    b: Bool?;
}

contract TestContract {
    data: OptionalInner;

    init() {
        self.data = OptionalInner{
            inner: Inner{
                a: null,
                b: null
            }
        };
    }
}