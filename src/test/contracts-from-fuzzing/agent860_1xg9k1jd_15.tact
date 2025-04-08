struct Complex {
    i: Int;
    b: Bool;
    a: Address;
    c: Cell;
    s: Slice;
    str: String;

    oi: Int?;
    ob: Bool?;
    oa: Address?;
    oc: Cell?;
    os: Slice?;
    ostr: String?;
}

contract MixedOptional {
    pers: Complex;

    init() {
        self.pers = Complex{
            i:1, b:true, a:myAddress(), c:emptyCell(), s:emptyCell().asSlice(), str:"hi",
            oi:null, ob:null, oa:null, oc:null, os:null, ostr:null
        };
    }
}