struct HasSlice {
    s: Slice;
    b: Bool;
}

contract TestContract {
    foo: HasSlice;

    init() {
        self.foo = HasSlice{
            s: emptyCell().asSlice(),
            b: true
        };
    }
}