struct OptionalNest {
    inner: Inner?;
}
struct Inner {
    s: String?;
    b: Bool?;
}

contract Test {
    f: OptionalNest;

    init() {
        self.f = OptionalNest{
            inner: Inner{ s:null, b:null }
        };
    }
}