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
    k: String?;
}

contract BigStructHolder {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a:1, b:true, c:myAddress(), d:emptyCell(), e:emptyCell().asSlice(),
            f:"hi", g:null, h:null, i:null, j:null, k:null
        };
    }
}