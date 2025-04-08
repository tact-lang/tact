struct Nested {
    foo: Int;
    bar: Bool;
}

contract Test1 {
    param: Nested;
    init() {
        self.param = Nested{ foo: 1, bar: true };
    }
}