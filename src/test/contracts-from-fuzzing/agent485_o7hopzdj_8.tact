struct InnerOptional {
    a: Int?;
    b: Bool?;
}

struct OuterOptional {
    nested: InnerOptional?;
    flag: Bool;
}

contract OptionalNestedTest {
    data: OuterOptional;
    init() {
        self.data = OuterOptional {
            nested: InnerOptional{ a: null, b: true },
            flag: false
        };
    }
}