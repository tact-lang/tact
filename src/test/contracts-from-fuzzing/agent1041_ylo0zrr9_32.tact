struct StructDeeper {
    layer1: StructA;
    layer2: StructB;
    layer3: StructC;
}

struct StructA {
    x: Int;
    y: Int;
}

struct StructB {
    flag: Bool;
    text: String?;
}

struct StructC {
    z: Int?;
    s: String;
}

contract DeepFields {
    data: StructDeeper;

    init() {
        self.data = StructDeeper{
            layer1: StructA{ x:1, y:2 },
            layer2: StructB{ flag:true, text:null },
            layer3: StructC{ z:null, s:"done" }
        };
    }
}
