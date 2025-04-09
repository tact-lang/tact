struct MixedTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Address;
}

contract TestContract {
    data: MixedTypes;

    init() {
        self.data = MixedTypes{
            a: 42,
            b: true,
            c: "hello",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: beginCell(),
            g: myAddress()
        };
    }
}
