struct HasOptionalNested {
    n: Nested?;
}

struct Nested {
    a: Int;
    b: Int?;
}

contract OptNestedTest {
    val: HasOptionalNested;
    init() {
        self.val = HasOptionalNested{
            n: null
        };
    }
}