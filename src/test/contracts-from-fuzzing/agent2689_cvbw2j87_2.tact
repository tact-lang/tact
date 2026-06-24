struct InnerLevel {
    val: Int;
    flag: Bool;
}

struct OuterLevel {
    inner: InnerLevel;
    text: String;
}

contract NestedStructStorage {
    s: OuterLevel;

    init() {
        self.s = OuterLevel{
            inner: InnerLevel{
                val: 42,
                flag: true,
            },
            text: "test",
        };
    }
}