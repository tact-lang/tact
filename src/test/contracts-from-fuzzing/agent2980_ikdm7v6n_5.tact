struct NestedOpt {
    inner: Inner?;
}

struct Inner {
    flag: Bool;
    num: Int;
}

contract Test {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            inner: null,
        };
    }
}