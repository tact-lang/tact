struct DeeplyNested {
    level: Int;
    next: Inner?;
}

struct Inner {
    value: Int;
    flag: Bool;
}

contract Test {
    data: DeeplyNested;
    init() {
        self.data = DeeplyNested{
            level: 1,
            next: Inner{ value: 42, flag: true }
        };
    }
}