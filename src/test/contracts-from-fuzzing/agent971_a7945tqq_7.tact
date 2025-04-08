struct InnerStruct1 { x: Int; }
struct InnerStruct2 { y: Bool; }
struct InnerStruct3 { z: String; }

struct ComplexStruct {
    a: InnerStruct1;
    b: InnerStruct2;
    c: InnerStruct3;
}

contract ComboFields {
    data: ComplexStruct;

    init() {
        self.data = ComplexStruct{
            a: InnerStruct1{x:1},
            b: InnerStruct2{y:true},
            c: InnerStruct3{z:"hi"}
        };
    }
}