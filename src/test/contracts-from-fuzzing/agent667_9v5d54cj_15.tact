struct MultiPrim {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    strVal: String;
    sliceVal: Slice;
}

contract StructManyTypes {
    data: MultiPrim;

    init() {
        self.data = MultiPrim{
            intVal: 42,
            boolVal: true,
            addrVal: myAddress(),
            strVal: "hey",
            sliceVal: emptyCell().asSlice()
        };
    }
}
