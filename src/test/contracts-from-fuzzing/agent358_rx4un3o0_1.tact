struct NestedInner {
    value: Int = 1;
}

struct NestedOuter {
    inner: NestedInner;
    flag: Bool = true;
}

contract TestStorage {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{value: 42},
            flag: false
        };
    }
}
