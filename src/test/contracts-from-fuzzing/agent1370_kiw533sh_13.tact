struct InnerStruct1 {
    x: Int;
    y: Bool;
}

struct InnerStruct2 {
    z: String;
    w: Int?;
}

struct OuterComplex {
    a: InnerStruct1;
    b: InnerStruct2;
    toggle: Bool;
}

contract ComplexCombinationTest {
    storage: OuterComplex;

    init() {
        self.storage = OuterComplex{
            a: InnerStruct1{x: 7, y: true},
            b: InnerStruct2{z: "hi", w: null},
            toggle: false
        };
    }
}