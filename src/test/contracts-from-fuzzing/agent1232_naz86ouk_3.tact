struct DeepNestedInner {
    alpha: Int;
    beta: Bool;
}

struct DeepNestedMid {
    inner: DeepNestedInner;
    flag: Bool;
}

struct DeepNestedOuter {
    mid: DeepNestedMid;
    gamma: Int;
}

contract DeepNestingTest {
    data: DeepNestedOuter;

    init() {
        self.data = DeepNestedOuter{
            mid: DeepNestedMid{
                inner: DeepNestedInner{
                    alpha: 1,
                    beta: false
                },
                flag: true
            },
            gamma: 99
        };
    }
}
