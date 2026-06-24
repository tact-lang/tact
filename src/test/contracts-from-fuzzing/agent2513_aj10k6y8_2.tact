struct Inner {
    intval: Int;
    boolval: Bool;
    sliceval: Slice;
    strval: String;
    cellval: Cell;
}

contract VariousPrimitives {
    mixed: Inner;

    init() {
        self.mixed = Inner{
            intval: 1,
            boolval: true,
            sliceval: emptyCell().asSlice(),
            strval: "hello",
            cellval: emptyCell(),
        };
    }
}