struct OptionalInner {
    a: Int?;
    b: String?;
}

struct OptionalNest {
    inner: OptionalInner?;
    c: Bool;
}

contract OptionalNestContract {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            inner: null,
            c: true
        };
    }
}