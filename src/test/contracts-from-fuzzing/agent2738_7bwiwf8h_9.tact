struct Large {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Bool?;
    h: String?;
    i: Cell?;
    j: Address?;
}

contract AllFieldTypes {
    f: Large;

    init() {
        self.f = Large{
            a:1, b:true, c:"hi", d:emptyCell(), e:emptyCell().asSlice(), f:myAddress(),
            g:null, h:null, i:null, j:null
        };
    }
}
