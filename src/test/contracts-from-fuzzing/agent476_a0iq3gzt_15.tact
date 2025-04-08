struct Mix {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    cl: Cell;
    sl: Slice;
    oi: Int?;
    ob: Bool?;
    os: String?;
    oa: Address?;
    ocl: Cell?;
    osl: Slice?;
}

contract MixedFields {
    data: Mix;

    init() {
        self.data = Mix{
            i:1, b:true, s:"s", a:myAddress(), cl:emptyCell(), sl:emptyCell().asSlice(),
            oi:null, ob:null, os:null, oa:null, ocl:null, osl:null
        };
    }
}
