struct HasSlice {
    content: Slice;
}

contract SliceStructStorage {
    foo: HasSlice;

    init() {
        self.foo = HasSlice{
            content: emptyCell().asSlice(),
        };
    }
}