struct Nested {
    field1: Int;
    field2: Bool;
    field3: String?;
}

contract TestContract {
    foo: Int;
    bar: Bool = false;
    baz: String = "hello";
    nest: Nested;
    
    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = "world";
        self.nest = Nested{
            field1: 42,
            field2: true,
            field3: "nested",
        };
    }
    
    receive() {
        self.foo += 1;
    }
}