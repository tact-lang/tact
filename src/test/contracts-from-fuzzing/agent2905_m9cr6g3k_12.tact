struct S {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

struct Outer {
    inner1: S;
    inner2: S;
    
    // very wide nested struct
    bigInt: Int;
    bigBool: Bool;
    bigAddr: Address;
    bigCell: Cell;
    bigSlice: Slice;
    bigStr: String;
}

contract NestedWide {
    storage: Outer;

    init() {
        self.storage = Outer{
            inner1: S{ a:null, b:null, c:null, d:null, e:null, f:null },
            inner2: S{ a:null, b:null, c:null, d:null, e:null, f:null },
            bigInt: 1,
            bigBool: true,
            bigAddr: myAddress(),
            bigCell: emptyCell(),
            bigSlice: emptyCell().asSlice(),
            bigStr: "x"
        };
    }
}