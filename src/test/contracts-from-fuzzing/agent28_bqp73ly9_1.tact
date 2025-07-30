struct NestedPoint {
    x: Int as int64;
    y: Int as int64;
}

struct DeepNested {
    np1: NestedPoint;
    np2: NestedPoint;
    flag: Bool;
    comment: String;
}

contract DeepStorage {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            np1: NestedPoint{ x: 1, y: 2 },
            np2: NestedPoint{ x: 3, y: 4 },
            flag: true,
            comment: "hello",
        };
    }
}