struct InnerNested {
    flag: Bool;
    optionalNum: Int?;
}

struct OuterNested {
    inner: InnerNested;
    name: String;
    maybeString: String?;
}

contract DeeplyNestedTest {
    info: OuterNested;
    
    init() {
        self.info = OuterNested{
            inner: InnerNested{
                flag: true,
                optionalNum: null,
            },
            name: "Hello",
            maybeString: null,
        };
    }
}
