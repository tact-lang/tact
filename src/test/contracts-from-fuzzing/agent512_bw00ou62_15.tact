struct MultiLevelDefaults {
    a: Int = 11;
    b: Bool = true;
    nested: InlineDefaults;
}

contract MultiDefaultStructTest {
    data: MultiLevelDefaults;

    init() {
        self.data = MultiLevelDefaults{
            nested: InlineDefaults{}
        };
    }
}

struct InlineDefaults {
    x: Int = 7;
    y: String = "hi";
}
