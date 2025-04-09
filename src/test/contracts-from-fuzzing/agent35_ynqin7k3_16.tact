struct WithVarious {
    a: Int;
    b: String;
    c: Bool;
    d: Slice;
    e: Cell;
    f: Address;
}

contract StorageVarious {
    data: WithVarious;

    init() {
        self.data = WithVarious{
            a: 1,
            b: "hello",
            c: true,
            d: emptyCell().asSlice(),
            e: emptyCell(),
            f: myAddress(),
        };
    }
}