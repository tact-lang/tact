struct InnerNested {
    a: Int;
    b: Bool;
}

struct Nested {
    c: Int;
    d: InnerNested;
    e: Bool?;
}

contract DeepNestedTest {
    data: Nested;

    init() {
        self.data = Nested{
            c: 5,
            d: InnerNested{ a:10, b:true },
            e: null
        };
    }
}