struct InnerStruct {
    a: Int?;
    b: Bool;
}

contract OptFieldTest {
    s1: InnerStruct?;
    s2: InnerStruct?;
    s3: InnerStruct;

    init() {
        self.s1 = null;
        self.s2 = InnerStruct{ a:null, b:true };
        self.s3 = InnerStruct{ a:5, b:false };
    }
}
