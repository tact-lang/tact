struct InnerLevel {
    flag: Bool;
    x: Int;
}

struct OuterLevel {
    inner: InnerLevel;
    label: String;
}

contract DeepNestedTest {
    complexField: OuterLevel;

    init() {
        self.complexField = OuterLevel{
            inner: InnerLevel{flag: true, x: 42},
            label: "test",
        };
    }
}