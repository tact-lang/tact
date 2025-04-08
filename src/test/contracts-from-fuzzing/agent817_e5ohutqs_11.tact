struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Bool?;
    f: Int?;
    g: String;
    h: Slice;
    i: Cell;
    j: Int as int64;
    k: Int as uint32;
}

contract Test {
    s: S;

    init() {
        self.s = S{
            a:1,b:true,c:"hi",d:myAddress(),e:null,f:null,g:"bye",h:emptyCell().asSlice(),i:emptyCell(),j:5,k:6
        };
    }
}