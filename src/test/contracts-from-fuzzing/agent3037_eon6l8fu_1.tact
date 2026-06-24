struct Nested1 {
    a: Int;
    b: Int?;
}

struct Nested2 {
    c: Bool;
    d: Nested1;
    e: String?;
}

contract DeepNestedTest {
    val: Nested2;
    init() {
        self.val = Nested2{
            c: true,
            d: Nested1{a: 12, b: null},
            e: "hello",
        };
    }
}