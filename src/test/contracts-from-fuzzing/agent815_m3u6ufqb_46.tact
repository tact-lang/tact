struct AllKinds {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
    bu: Builder;
    oi: Int?;
    ob: Bool?;
    os: String?;
    oa: Address?;
    oc: Cell?;
    osl: Slice?;
    obu: Builder?;
}

contract AllKindsStore {
    d: AllKinds;

    init() {
        self.d = AllKinds{
            i:1,b:true,s:"s",a:myAddress(),c:emptyCell(),sl:emptyCell().asSlice(),bu:beginCell(),
            oi:null,ob:null,os:null,oa:null,oc:null,osl:null,obu:null
        };
    }
}