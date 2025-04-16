struct InnerStruct {
    x: Int;
    y: Bool?;
    z: String?;
}

contract ArrayOfStructs {
    a: InnerStruct;
    b: InnerStruct;
    c: InnerStruct;

    init() {
        self.a = InnerStruct{ x:1, y:true, z:"a" };
        self.b = InnerStruct{ x:2, y:null, z:"b" };
        self.c = InnerStruct{ x:3, y:false, z:null };
    }
}