struct Mix {
    intVal: Int;
    boolVal: Bool;
    addr: Address;
    slice: Slice;
    cell: Cell;
    str: String;
}

contract MixTest {
    data: Mix;

    init() {
        self.data = Mix{
            intVal:42, boolVal:true, addr:myAddress(),
            slice:emptyCell().asSlice(), cell:emptyCell(), str:"hi"
        };
    }
}