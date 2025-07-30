struct InnerLevel {
    val: Int;
}

struct OuterLevel {
    nested: InnerLevel;
    optionalVal: Int?;
}

contract DeepTest {
    deep: OuterLevel;

    init() {
        self.deep = OuterLevel{
            nested: InnerLevel{ val: 42 },
            optionalVal: null,
        };
    }
}