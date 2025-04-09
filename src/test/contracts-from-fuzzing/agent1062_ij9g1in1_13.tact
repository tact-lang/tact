struct InnerStruct {
    a: Int;
    b: Bool;
}

struct OuterStruct {
    s1: InnerStruct;
    s2: InnerStruct;
    s3: InnerStruct;
}

contract ComplexContract {
    data1: OuterStruct;
    data2: InnerStruct;
    data3: Int;
    data4: Bool;

    init() {
        self.data1 = OuterStruct{
            s1: InnerStruct{a:1,b:true},
            s2: InnerStruct{a:2,b:false},
            s3: InnerStruct{a:3,b:true}
        };
        self.data2 = InnerStruct{a:4,b:false};
        self.data3 = 42;
        self.data4 = true;
    }
}