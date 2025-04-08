struct NestedInner {
    f1: Int;
    f2: String;
}

struct NestedOuter {
    inner: NestedInner;
    flag: Bool;
}

contract TestContract {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{f1: 123, f2: "abc"},
            flag: true
        };
    }
}
