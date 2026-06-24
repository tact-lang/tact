struct Nested1 {
    a: Int;
    b: Bool;
}

struct Nested2 {
    n: Nested1;
    c: String;
}

contract DeepTest {
    field1: Nested2;

    init() {
        self.field1 = Nested2{
            n: Nested1{a: 1, b: true},
            c: "hello"
        };
    }
}