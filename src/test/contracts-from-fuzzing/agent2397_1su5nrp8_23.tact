struct ManyPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
}

contract ContractManyPrimitives {
    state: ManyPrimitives;
    init() {
        self.state = ManyPrimitives{
            a: 123,
            b: true,
            c: "hi",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice()
        };
    }
    receive() {}
}