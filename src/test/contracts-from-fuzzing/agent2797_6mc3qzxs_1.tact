struct Nested {
    a: Int;
    b: Bool;
    c: String;
}

contract DeepNestedTest {
    foo: Int = 1;
    nested: Nested;
   
    init() {
        self.nested = Nested{
            a: 42,
            b: true,
            c: "hello"
        };
    }
}