struct LargeMix {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Slice;
    k: Int;
    l: Int?;
}

contract LargeMixContract {
    s: LargeMix;

    init() {
        self.s = LargeMix{
            a:1, b:null,
            c:true, d:null,
            e:"hi", f:null,
            g:myAddress(), h:null,
            i:emptyCell(), j:emptyCell().asSlice(),
            k:555, l:null,
        };
    }
}