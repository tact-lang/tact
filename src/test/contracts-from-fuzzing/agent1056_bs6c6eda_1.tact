struct Nested {
    bar: Bool;
    num: Int as uint32;
}

contract TestContract {
    foo: Nested;
    
    init() {
        self.foo = Nested{ bar: true, num: 42 };
    }
}