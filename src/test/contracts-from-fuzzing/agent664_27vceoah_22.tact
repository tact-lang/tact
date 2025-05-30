struct ManyFieldsA {
    a1: Int;
    a2: Bool;
    a3: String;
    a4: Int;
    a5: Bool;
    a6: String;
}

struct ManyFieldsB {
    b1: Int;
    b2: ManyFieldsA;
    b3: Bool?;
    b4: String?;
}

contract BigStructs {
    data: ManyFieldsB;

    init() {
        self.data = ManyFieldsB{
            b1:1,
            b2:ManyFieldsA{a1:1,a2:true,a3:"x",a4:2,a5:false,a6:"y"},
            b3:null,
            b4:null
        };
    }
}
