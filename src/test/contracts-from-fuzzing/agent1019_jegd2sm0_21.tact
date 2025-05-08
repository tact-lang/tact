struct Nested {
    foo: Int;
    bar: Bool;
}

contract TestContract(
    nested: Nested,
) {
    receive() {
        dump(self.nested.foo + 1);
    }
}