struct Combo {
    i: Int;
    bi: Bool;
    ai: Address;
    ci: Cell;
    si: Slice;
    oi: Int?;
    ob: Bool?;
    oa: Address?;
    oc: Cell?;
    os: Slice?;
}

contract ComboContract {
    val: Combo;
    init() {
        self.val = Combo{
            i:1, bi:true, ai:myAddress(), ci:emptyCell(), si:emptyCell().asSlice(),
            oi:null, ob:null, oa:null, oc:null, os:null
        };
    }
}