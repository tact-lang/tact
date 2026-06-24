struct OptInner {
    a: Int?;
    b: Bool;
}

struct OuterOpt {
    inner: OptInner?;
    c: String;
}

contract NestedOptionalStructTest {
    field: OuterOpt;

    init() {
        self.field = OuterOpt {
            inner: null,
            c: "abc"
        };
    }
}