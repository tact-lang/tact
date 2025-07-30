struct InnerStruct {
    foo: Int;
    bar: Bool;
}

contract StructList {
    s1: InnerStruct;
    s2: InnerStruct;
    s3: InnerStruct;

    init() {
        self.s1 = InnerStruct{foo:1,bar:true};
        self.s2 = InnerStruct{foo:2,bar:false};
        self.s3 = InnerStruct{foo:3,bar:true};
    }
}