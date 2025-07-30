struct Complex {
    intVal: Int;
    boolVal: Bool;
    sliceVal: Slice;
    addrVal: Address;
    optStr: String?;
    optAddr: Address?;
}

contract LotsOfTypes {
    cmp: Complex;

    init() {
        self.cmp = Complex{
            intVal: 5,
            boolVal: true,
            sliceVal: emptyCell().asSlice(),
            addrVal: myAddress(),
            optStr: null,
            optAddr: null
        };
    }
}