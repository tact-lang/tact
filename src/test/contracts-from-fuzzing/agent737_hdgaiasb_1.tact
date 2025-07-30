struct MultiDepth {
    inner: NestedInner;
}

struct NestedInner {
    x: Int;
    y: InnerInner;
}

struct InnerInner {
    flag: Bool;
    text: String;
}

contract TestContract {
    field: MultiDepth;

    init() {
        self.field = MultiDepth{
            inner: NestedInner{
                x: 10,
                y: InnerInner{
                    flag: true,
                    text: "deep"
                }
            }
        };
    }
}
