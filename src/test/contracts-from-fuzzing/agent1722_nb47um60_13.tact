struct NestedBools {
    a: Bool;
    inner: InnerBools;
}

struct InnerBools {
    x: Bool;
    y: Bool;
}

contract DeepBool {
    data: NestedBools;
    init() {
        self.data = NestedBools{
            a: true,
            inner: InnerBools{ x: false, y: true }
        };
    }
}