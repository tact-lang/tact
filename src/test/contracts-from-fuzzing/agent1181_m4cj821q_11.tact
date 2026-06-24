struct BigStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: String;
    e: String?;
    f: Bool?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Slice;
    k: Cell?;
    l: Slice?;
}

contract TestContract {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a:1, b:true, c:null, d:"hi", e:null, f:false,
            g:myAddress(), h:null, i:emptyCell(), j:emptyCell().asSlice(),
            k:null, l:null
        };
    }
}