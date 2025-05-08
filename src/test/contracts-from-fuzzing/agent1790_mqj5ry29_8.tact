struct FlatTen {
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
}

contract FlatTenFields {
    param: FlatTen;

    init() {
        self.param = FlatTen{
            a:1, b:true, c:myAddress(), d:emptyCell(), e:emptyCell().asSlice(),
            f:"", g:null, h:null, i:null, j:null
        };
    }
}
