struct WithManyTypes {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Builder;
    g: Slice;
}

contract TestContract {
    store: WithManyTypes;

    init() {
        self.store = WithManyTypes{
            a: 1,
            b: false,
            c: myAddress(),
            d: "hello",
            e: emptyCell(),
            f: beginCell(),
            g: emptyCell().asSlice(),
        };
    }
}