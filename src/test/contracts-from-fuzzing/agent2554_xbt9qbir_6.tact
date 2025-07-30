struct LongFlat {
    v1: Int;
    v2: Int;
    v3: Int;
    v4: Int;
    v5: Int;
    v6: Int;
    v7: Int;
    v8: Int;
    v9: Int;
    v10: Int;
    v11: Bool;
    v12: Bool;
    v13: Bool;
    v14: Bool;
    v15: Bool;
    v16: Bool;
    v17: Bool;
    v18: Bool;
    v19: Bool;
    v20: Bool;
}

contract LongFlatFields {
    s: LongFlat;

    init() {
        self.s = LongFlat{
            v1:1,v2:2,v3:3,v4:4,v5:5,v6:6,v7:7,v8:8,v9:9,v10:10,
            v11:true,v12:false,v13:true,v14:false,v15:true,v16:false,v17:true,v18:false,v19:true,v20:false
        };
    }
}