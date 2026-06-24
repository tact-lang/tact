struct Combo {
    intField: Int;
    smallInt: Int as uint4;
    boolField: Bool;
    optBool: Bool?;
    addressField: Address;
    optAddress: Address?;
    stringField: String;
    sliceField: Slice;
    cellField: Cell;
}

contract ComplexStructTest {
    data: Combo;

    init() {
        self.data = Combo{
            intField: 1,
            smallInt: 7,
            boolField: true,
            optBool: null,
            addressField: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            optAddress: null,
            stringField: "hello",
            sliceField: emptyCell().asSlice(),
            cellField: emptyCell(),
        };
    }
}