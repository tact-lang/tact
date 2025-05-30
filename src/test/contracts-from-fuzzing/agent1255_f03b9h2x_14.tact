struct S {
    foo: Int;
    payload: Slice as remaining;
}

contract Test14 {
    data: S;

    init() {
        self.data = S{
            foo: 42,
            payload: emptyCell().asSlice(),
        };
    }
}