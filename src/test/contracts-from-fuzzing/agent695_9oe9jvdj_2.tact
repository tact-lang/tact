struct Nested {
    foo: Int;
    bar: Int?;
}

contract NestedStructTest {
    n: Nested;

    init() {
        self.n = Nested{foo: 1, bar: null};
    }
}