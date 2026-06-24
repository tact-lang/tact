struct LargeNested {
    n1: Int;
    n2: Int;
    n3: Int;
    n4: Int;
    n5: Int;
    str: String;
    opt: Bool?;
    inner: InnerStruct;
}

struct InnerStruct {
    i1: Int;
    i2: Bool;
    s: String?;
}

contract CN {
    field: LargeNested;

    init() {
        self.field = LargeNested {
            n1:1, n2:2, n3:3, n4:4, n5:5,
            str:"abc", opt:true,
            inner: InnerStruct {i1:7, i2:false, s:null}
        };
    }
}