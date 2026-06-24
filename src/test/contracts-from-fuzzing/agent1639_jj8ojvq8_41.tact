struct OuterStruct {
    inn1: InnerStruct1;
    inn2: InnerStruct2;
}

struct InnerStruct1 {
    a: Int;
    b: String?;
}

struct InnerStruct2 {
    x: Bool;
    y: String;
}

contract MultiStructField {
    d: OuterStruct;

    init() {
        self.d = OuterStruct{
            inn1: InnerStruct1{ a:1, b:null },
            inn2: InnerStruct2{ x:true, y:"hi" },
        };
    }
}
