struct NestedPoint {
    x: Int as int64;
    y: Int as int64;
}

struct DeepNested {
    point: NestedPoint;
    label: String;
    flag: Bool = false;
    optionalValue: Int?;
}

contract TestContract {
    stored: DeepNested;
    
    init() {
        self.stored = DeepNested{
            point: NestedPoint{ x: 1, y: 2 },
            label: "hello",
            flag: true,
            optionalValue: 42,
        };
    }
}