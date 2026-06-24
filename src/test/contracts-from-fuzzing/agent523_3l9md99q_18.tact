contract ContractWithStructList {
    s1: InnerStruct;
    s2: InnerStruct;
    s3: InnerStruct;
    init() {
        self.s1 = InnerStruct{ x:1, y:true };
        self.s2 = InnerStruct{ x:2, y:false };
        self.s3 = InnerStruct{ x:3, y:true };
    }
}

struct InnerStruct {
    x: Int;
    y: Bool;
}