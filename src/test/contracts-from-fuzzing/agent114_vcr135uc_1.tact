struct NestedStruct {
    s1: InnerStruct1;
    s2: InnerStruct2;
}

struct InnerStruct1 {
    a: Int;
    b: Bool?;
    c: String;
}

struct InnerStruct2 {
    x: Int?;
    y: String;
    z: Bool;
}

contract TestNestedStruct {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            s1: InnerStruct1{a: 1, b: true, c: "x"},
            s2: InnerStruct2{x: null, y: "y", z: false},
        };
    }
}
