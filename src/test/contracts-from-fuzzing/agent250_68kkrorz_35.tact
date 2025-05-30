struct InnerStruct {
    a: Int;
    b: Bool;
}

contract ListOfStructs {
    s1: InnerStruct;
    s2: InnerStruct;
    s3: InnerStruct;

    init() {
        self.s1 = InnerStruct{a:1,b:true};
        self.s2 = InnerStruct{a:2,b:false};
        self.s3 = InnerStruct{a:3,b:true};
    }
}