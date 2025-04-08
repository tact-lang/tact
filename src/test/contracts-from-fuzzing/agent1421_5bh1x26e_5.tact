struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
}

contract StoreBigStruct {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a: 7, b: true, c: "hi", d: myAddress(), e: emptyCell(), f: emptyCell().asSlice() };
    }
}