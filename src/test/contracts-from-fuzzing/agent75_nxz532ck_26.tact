struct Nested {
    foo: Int? = null;
    rest: Slice as remaining;
}

contract Test {
    complex: Nested;

    init() {
        self.complex = Nested{ rest: emptyCell().asSlice() };
    }
}