struct MultiplePrimitiveTypes {
    a: Int;
    b: Bool;
    c: Cell;
    d: Address;
    e: Slice;
    f: String;
}

contract TestContract {
    mixedFields: MultiplePrimitiveTypes;

    init() {
        self.mixedFields = MultiplePrimitiveTypes{
            a: 1,
            b: true,
            c: emptyCell(),
            d: myAddress(),
            e: emptyCell().asSlice(),
            f: "test"
        };
    }
}