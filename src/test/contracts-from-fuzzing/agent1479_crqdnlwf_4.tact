struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Bool?;
    f: Int?;
    g: Slice;
    h: Address;
    i: String;
    j: Bool;
}

contract Test {
    big: BigStruct;
    init() {
        self.big = BigStruct{
            a: 1, b: true, c: "hi", d: emptyCell(), e: null, f: null, g: emptyCell().asSlice(), h: myAddress(), i: "yo", j: false
        };
    }
}