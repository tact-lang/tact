struct InnerLevel {
    x: Int;
    y: Int?;
}

struct OuterLevel {
    nested: InnerLevel;
    flag: Bool;
    comment: String;
}

contract DeepNestedContract {
    data: OuterLevel;
    
    init() {
        self.data = OuterLevel{
            nested: InnerLevel{ x: 1, y: null },
            flag: false,
            comment: "test",
        };
    }
}