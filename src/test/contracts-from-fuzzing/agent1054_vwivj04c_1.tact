struct Inner {
    a: Int;
    b: Bool;
    c: Slice;
}

contract Test {
    item: Inner;
    init() {
        self.item = Inner{
            a: 1,
            b: true,
            c: emptyCell().asSlice(),
        };
    }
}