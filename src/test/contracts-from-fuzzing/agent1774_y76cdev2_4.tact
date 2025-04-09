struct BigStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: String;
    e: String?;
    f: Slice;
    g: Cell;
    h: Address;
    i: Bool?;
    j: Cell?;
    k: String;
    l: Bool;
    m: Int;
    n: Address?;
}

contract TestContract {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a:1, b:true, c:null, d:"d", e:null, f:emptyCell().asSlice(), g:emptyCell(), h:myAddress(),
            i:false, j:null, k:"k", l:true, m:-42, n:null
        };
    }
}
