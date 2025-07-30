struct L {
    v1: Int as uint8;
    v2: Int as uint8;
    v3: Int as uint8;
    v4: Int as uint8;
    v5: Int as uint8;
    v6: Int as uint8;
    v7: Int as uint8;
    v8: Int as uint8;
    v9: Int as uint8;
    v10: Int as uint8;
    v11: Int as uint8;
    v12: Int as uint8;
    v13: Int as uint8;
    v14: Int as uint8;
    v15: Int as uint8;
    v16: Int as uint8;
}

contract TestContract {
    l: L;

    init() {
        self.l = L{
            v1:1,v2:2,v3:3,v4:4,v5:5,v6:6,v7:7,v8:8,v9:9,v10:10,v11:11,v12:12,v13:13,v14:14,v15:15,v16:16
        };
    }
}