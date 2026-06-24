struct ManyTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
}

contract HeteroPrimitives {
    data: ManyTypes;

    init() {
        self.data = ManyTypes{
            a: 10,
            b: true,
            c: "str",
            d: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            e: emptyCell(),
            f: emptyCell().asSlice(),
        };
    }
}