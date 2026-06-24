struct Nested {
    inner: Int;
}

struct TopLevel {
    nested: Nested;
    flag: Bool;
    text: String;
    optNum: Int?;
}

contract NestedStructPersistence {
    data: TopLevel;
    
    init() {
        self.data = TopLevel{
            nested: Nested{ inner: 123 },
            flag: true,
            text: "hello",
            optNum: null,
        };
    }
}