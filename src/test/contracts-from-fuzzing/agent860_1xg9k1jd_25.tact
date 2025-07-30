struct ManyDefaults {
    v1: Int = 1;
    v2: Int = 2;
    v3: Int = 3;
    v4: Int = 4;
    v5: Int = 5;
    v6: Int = 6;
    v7: Int = 7;
    v8: Int = 8;
    v9: Int = 9;
    v10: Int = 10;
}

contract DefMany {
    data: ManyDefaults;
    init() {
        self.data = ManyDefaults{
            v1:11,v2:12,v3:13,v4:14,v5:15,
            v6:16,v7:17,v8:18,v9:19,v10:20
        };
    }
}