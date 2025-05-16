struct WithVariousTypes {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    a: Address;
    sl: Slice;
}

contract MultiTypeTest {
    store: WithVariousTypes;

    init() {
        self.store = WithVariousTypes{
            i: 11,
            b: false,
            s: "hello",
            c: emptyCell(),
            a: myAddress(),
            sl: emptyCell().asSlice(),
        };
    }
}