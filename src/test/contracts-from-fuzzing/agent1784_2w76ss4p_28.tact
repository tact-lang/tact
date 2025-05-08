struct StructWithComplex {
    i: Int;
    o: Int?;
    s: String;
    os: String?;
    b: Bool;
    ob: Bool?;
    c: Cell;
    oc: Cell?;
}

contract ComplexFields {
    val: StructWithComplex;

    init() {
        self.val = StructWithComplex{
            i:1,
            o:null,
            s:"A",
            os:null,
            b:true,
            ob:false,
            c:emptyCell(),
            oc:null
        };
    }
}