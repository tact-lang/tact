struct BigStruct {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: Cell?;
    k: Slice?;
    l: String?;
}

contract Test {
    s: BigStruct;

    init() {
        self.s = BigStruct{
            a:1, b:true, c:myAddress(), d:emptyCell(), e:emptyCell().asSlice(), f:"foo",
            g:2, h:false, i:myAddress(), j:emptyCell(), k:emptyCell().asSlice(), l:"bar"
        };
    }

    receive() {}
}