struct InnerStruct {
    a: Int;
    b: String;
    c: Bool;
}

contract LargeContractFields {
    ia: InnerStruct;
    ib: InnerStruct;
    ic: InnerStruct;
    id: InnerStruct;
    ie: InnerStruct;

    init() {
        self.ia = InnerStruct{ a:1, b:"x", c:true };
        self.ib = InnerStruct{ a:2, b:"y", c:false };
        self.ic = InnerStruct{ a:3, b:"z", c:true };
        self.id = InnerStruct{ a:4, b:"w", c:false };
        self.ie = InnerStruct{ a:5, b:"v", c:true };
    }
}