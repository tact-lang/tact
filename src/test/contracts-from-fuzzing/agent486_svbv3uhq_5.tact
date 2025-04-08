struct Complex {
    intVal: Int = 1;
    boolVal: Bool = false;
    stringVal: String = "";
    // remove invalid default values
    cellVal: Cell; 
    sliceVal: Slice;
    addrVal: Address;
    optVal: Int? = null;
}

contract ComplexStorage {
    complex: Complex;

    init() {
        self.complex = Complex{
            intVal: 999,
            boolVal: true,
            stringVal: "hi",
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            addrVal: myAddress(),
            optVal: 7,
        };
    }
}