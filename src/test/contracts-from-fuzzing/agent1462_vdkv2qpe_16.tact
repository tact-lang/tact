struct InnerLevel {
    foo: String;
}

struct MiddleLevel {
    inner: InnerLevel;
}

struct OuterLevel {
    middle: MiddleLevel;
    optStr: String?;
}

contract ComplexTest {
    data: OuterLevel;

    init() {
        self.data = OuterLevel{
            middle: MiddleLevel{ inner: InnerLevel{ foo: "bar" } },
            optStr: null
        };
    }
}