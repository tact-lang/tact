struct NestedOptionals {
    s: String?;
    inner: Inner?;
}

struct Inner {
    x: Int;
    flag: Bool;
}

contract NestedOptTest {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            s: null,
            inner: null
        };
    }
}
