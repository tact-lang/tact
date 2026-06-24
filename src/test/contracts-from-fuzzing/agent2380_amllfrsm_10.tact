// contract field is an optional nested struct
struct Inner {
    x: Int;
    y: Int;
}

contract TestContract {
    optInner: Inner?;
    init() {
        self.optInner = null;
    }
}