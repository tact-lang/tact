struct Mixed {
    i: Int;
    b: Bool;
    s: String;
    addr: Address;
    c: Cell;
    sl: Slice;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optAddr: Address?;
    optCell: Cell?;
    optSlice: Slice?;
}

contract TestContract {
    state: Mixed;

    init() {
        self.state = Mixed{
            i:1, b:true, s:"hi", addr:myAddress(), c:emptyCell(), sl:emptyCell().asSlice(),
            optInt:null, optBool:null, optStr:null,
            optAddr:null, optCell:null, optSlice:null
        };
    }
}