struct NestedSameType {
    inner1: Inner;
    inner2: Inner;
}

struct Inner {
    val: Int;
}

contract NestedSameTypeContract {
    data: NestedSameType;

    init() {
        self.data = NestedSameType {
            inner1: Inner{ val: 10 },
            inner2: Inner{ val: 20 }
        };
    }
}