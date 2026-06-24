struct InnerLevel {
    val: Int;
    flag: Bool;
}

struct OuterLevel {
    inner: InnerLevel;
    note: String;
}

contract NestedStructsTest {
    nested: OuterLevel;

    init() {
        self.nested = OuterLevel{
            inner: InnerLevel{
                val: 42,
                flag: true
            },
            note: "test"
        };
    }
}