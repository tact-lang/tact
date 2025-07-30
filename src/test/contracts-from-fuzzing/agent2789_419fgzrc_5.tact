struct DeepNested {
    level: Int;
    inner: InnerLevel;
}

struct InnerLevel {
    name: String;
    opt: OptLevel;
}

struct OptLevel {
    flag: Bool?;
}

contract DeepNestedStructTest {
    deep: DeepNested;

    init() {
        self.deep = DeepNested{
            level: 5,
            inner: InnerLevel{
                name: "deep",
                opt: OptLevel{
                    flag: false
                }
            }
        };
    }
}
