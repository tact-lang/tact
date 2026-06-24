struct Mix {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    a: Address;
    oi: Int?;
    ob: Bool?;
    os: String?;
    oc: Cell?;
    oa: Address?;
}

contract TestMixAll {
    data: Mix;
    init() {
        self.data = Mix{
            i:1, b:true, s:"hi", c:emptyCell(), a:myAddress(),
            oi:null, ob:null, os:null, oc:null, oa:null
        };
    }
}