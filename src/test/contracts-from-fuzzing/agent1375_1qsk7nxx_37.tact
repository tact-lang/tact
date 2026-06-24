struct StructManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
}

contract StructManyFieldsContract {
    nested: StructManyFields;
    text: String;

    init() {
        self.nested = StructManyFields{
            a: 11,
            b: true,
            c: "str",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
        };
        self.text = "text";
    }
}