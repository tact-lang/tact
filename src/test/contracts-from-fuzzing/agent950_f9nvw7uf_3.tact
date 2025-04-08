struct NestedOpt {
    inner: Inner?;
}

struct Inner {
    x: Int;
}

contract NestedOptTest {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{ inner: null };
    }
}