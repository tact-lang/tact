struct DefaultStringNested {
    s: String = "hello";
    nested: Nested;
}

struct Nested {
    flag: Bool = false;
    opt: Int?;
}

contract DefaultsNestedTest {
    data: DefaultStringNested;

    init() {
        self.data = DefaultStringNested{
            nested: Nested{}
        };
    }
}