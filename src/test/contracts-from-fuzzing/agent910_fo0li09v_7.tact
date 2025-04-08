struct Mixed {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: Cell;
    g: Slice;
    h: Address;
}

contract Combo {
    m: Mixed;

    init() {
        self.m = Mixed{
            a:1,b:true,c:null,d:false,
            e:"hi",f:emptyCell(),g:emptyCell().asSlice(),h:myAddress()
        };
    }
}