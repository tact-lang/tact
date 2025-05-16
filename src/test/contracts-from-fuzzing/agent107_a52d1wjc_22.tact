struct WithManyTypes {
    i: Int;
    b: Bool;
    a: Address;
    s: String;
    c: Cell;
    sl: Slice;
    oi: Int?;
    ob: Bool?;
    oa: Address?;
    os: String?;
    oc: Cell?;
    osl: Slice?;
}

contract ManyTypes {
    val: WithManyTypes;

    init() {
        self.val = WithManyTypes{
            i:1,b:true,a:myAddress(),s:"x",c:emptyCell(),sl:emptyCell().asSlice(),
            oi:null, ob:null, oa:null, os:null, oc:null, osl:null
        };
    }
}