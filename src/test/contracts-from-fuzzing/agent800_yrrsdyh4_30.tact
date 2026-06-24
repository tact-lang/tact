struct MixTypes {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    bu: Builder;
    a: Address;
    oi: Int?;
    ob: Bool?;
    os: String?;
    oc: Cell?;
    osl: Slice?;
    obb: Builder?;
    oa: Address?;
}

contract MixStorage {
    val: MixTypes;
    init() {
        self.val = MixTypes{
            i:1, b:true, s:"h", c:emptyCell(), sl:emptyCell().asSlice(), bu:beginCell(), a:myAddress(),
            oi:null, ob:null, os:null, oc:null, osl:null, obb:null, oa:null,
        };
    }
}