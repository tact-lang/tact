struct BigMix {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    strVal: String;
}

contract TestContract {
    mix: BigMix;

    init() {
        self.mix = BigMix{
            intVal: 1,
            boolVal: true,
            addrVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            strVal: "hello"
        };
    }
}