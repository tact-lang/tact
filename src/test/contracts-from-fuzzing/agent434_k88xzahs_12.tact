struct ManyPrimitives {
    i: Int;
    b: Bool;
    addr: Address;
    c: Cell;
    s: Slice;
    str: String;
    oi: Int?;
    ob: Bool?;
    ostr: String?;
}

contract TestContract {
    k: ManyPrimitives;

    init() {
        self.k = ManyPrimitives{
            i:10, b:true, addr:myAddress(), c:emptyCell(), s:emptyCell().asSlice(),
            str:"", oi:null, ob:false, ostr:"kek"
        };
    }
}