struct Crazy {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    a: Address;
    oi: Int?;
    ob: Bool?;
    os: String?;
    oc: Cell?;
    osl: Slice?;
    oa: Address?;
}

contract TestContract {
    crazy: Crazy;

    init() {
        self.crazy = Crazy{
            i:1,b:true,s:"hi",c:emptyCell(),sl:emptyCell().asSlice(),a:myAddress(),
            oi:null, ob:null, os:null, oc:null, osl:null, oa:null
        };
    }
}