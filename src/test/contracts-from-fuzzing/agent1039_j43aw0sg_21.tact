struct S {
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
    v11: Int;
    v12: Int;
    v13: Int;
    v14: Int;
    v15: Int;
    v16: Int;
    v17: Int;
    v18: Int;
    v19: Int;
    v20: Int;
    v21: Int;
    v22: Int;
    v23: Int;
    v24: Int;
    v25: Int;
    v26: Int;
    v27: Int;
    v28: Int;
    v29: Int;
    v30: Int;
}

contract TestContract {
    big: S;

    init() {
        self.big = S{
            v1:1,v2:2,v3:3,v4:4,v5:5,v6:6,v7:7,v8:8,v9:9,v10:10,
            v11:11,v12:12,v13:13,v14:14,v15:15,v16:16,v17:17,v18:18,v19:19,v20:20,
            v21:21,v22:22,v23:23,v24:24,v25:25,v26:26,v27:27,v28:28,v29:29,v30:30
        };
    }
}