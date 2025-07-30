struct Nested {
    value: Int?;
}

contract NestedTest {
    n: Nested = Nested { value: null };

    receive() {}

    get fun getNested(): Nested {
        return self.n;
    }
}
