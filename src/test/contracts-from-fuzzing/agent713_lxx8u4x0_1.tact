struct Nested1 {
    a: Int;
    b: Bool;
}

struct Nested2 {
    c: String;
    d: Int?;
    e: Nested1;
}

contract DeepNestedTest {
    val: Nested2;
    
    init() {
        self.val = Nested2{
            c: "test",
            d: null,
            e: Nested1{
                a: 1,
                b: true
            }
        };
    }
}