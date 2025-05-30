struct TenInts {
    v0: Int;
    v1: Int;
    v2: Int;
    v3: Int;
    v4: Int;
    v5: Int;
    v6: Int;
    v7: Int;
    v8: Int;
    v9: Int;
}

contract BigNestedStruct {
    param: TenInts;

    init() {
        self.param = TenInts{
            v0:0, v1:1, v2:2, v3:3, v4:4, v5:5, v6:6, v7:7, v8:8, v9:9
        };
    }
}