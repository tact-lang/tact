struct Foo {
    a: Int?;
    b: Slice;
}

contract DefaultsOptional {
    data: Foo;

    init() {
        self.data = Foo{ a: null, b: emptyCell().asSlice() };
    }
}