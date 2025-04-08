struct Mix {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address?;
    cellVal: Cell;
    sliceVal: Slice;
}

contract Test8 {
    mix: Mix;
    init() {
        self.mix = Mix{
            intVal: 42,
            boolVal: true,
            strVal: "hello",
            addrVal: null,
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice()
        };
    }
}