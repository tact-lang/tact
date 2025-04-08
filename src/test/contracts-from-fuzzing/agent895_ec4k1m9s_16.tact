struct PrimitivesNested1 {
    a: Int;
    b: Bool;
    c: String;
}

struct PrimitivesNested2 {
    left: PrimitivesNested1;
    right: PrimitivesNested1;
    flag: Bool;
}

contract DoubleNest {
    data: PrimitivesNested2;

    init() {
        self.data = PrimitivesNested2{
            left: PrimitivesNested1{a:1,b:true,c:"L"},
            right: PrimitivesNested1{a:2,b:false,c:"R"},
            flag: true
        };
    }
}