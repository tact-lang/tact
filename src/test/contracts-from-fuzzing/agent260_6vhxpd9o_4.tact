struct Nested {
    a: Int;
    b: Bool;
    c: String;
}

contract NestedTest {
    data: Nested;
    
    init() {
        self.data = Nested{ a: 123, b: true, c: "hello" };
    }
}