struct InnerLevel {
    x: Int;
    y: Bool;
    z: String;
}

struct OuterLevel {
    nested: InnerLevel;
    flag: Bool;
}

contract DeepNestedTest {
    data: OuterLevel;

    init() {
        self.data = OuterLevel{
            nested: InnerLevel{ x: 5, y: false, z: "deep" },
            flag: true
        };
    }
}