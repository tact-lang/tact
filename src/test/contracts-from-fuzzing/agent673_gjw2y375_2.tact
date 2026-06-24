struct Nested {
    inner1: Int;
    inner2: Bool;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{
            inner1: 10,
            inner2: false
        };
    }
}