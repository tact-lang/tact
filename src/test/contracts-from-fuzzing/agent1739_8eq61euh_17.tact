struct MixedTypes {
    intval: Int;
    boolval: Bool;
    sliceval: Slice;
    cellval: Cell;
    strval: String;
    addrval: Address;
}

contract Test {
    fields: MixedTypes;

    init() {
        self.fields = MixedTypes{
            intval: 1,
            boolval: true,
            sliceval: "test".asComment().asSlice(),
            cellval: emptyCell(),
            strval: "hello",
            addrval: myAddress()
        };
    }
}
