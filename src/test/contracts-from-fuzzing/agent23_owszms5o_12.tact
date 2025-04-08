struct AllPrims {
    i: Int;
    b: Bool;
    a: Address;
    c: Cell;
    sl: Slice;
    s: String;
    oi: Int?;
    ob: Bool?;
    oa: Address?;
    os: String?;
}

contract PrimInit {
    data: AllPrims;

    init() {
        self.data = AllPrims{
            i:42, b:true, a:myAddress(), c:emptyCell(), sl:emptyCell().asSlice(), s:"hello",
            oi:7, ob:false, oa:myAddress(), os:"world"
        };
    }
}