struct Big {
    x: Int;
    y: Int;
    z: Int;
    s: String;
    c: Cell;
    sl: Slice;
    a: Address;
    o1: Int?;
    o2: String?;
}

contract ContractWithBigStruct {
    big: Big;

    init() {
        self.big = Big{
            x:1, y:2, z:3, s:"s", c:emptyCell(), sl:emptyCell().asSlice(), a:myAddress(), o1:null, o2:null
        };
    }
}
