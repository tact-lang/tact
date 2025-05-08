struct NestedDepth {
    inner1: Int;
    inner2: Int?;
    inner3: InnerMost;
}

struct InnerMost {
    flag: Bool;
    label: String;
}

contract DeepStorage {
    val: Int = 0;
    data: NestedDepth;

    init() {
        self.val = 1;
        self.data = NestedDepth{
            inner1: 10,
            inner2: null,
            inner3: InnerMost{
                flag: true,
                label: "test"
            }
        };
    }
}