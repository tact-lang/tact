struct LongStruct {
    v1: Int = 1; v2: Int = 2; v3: Int = 3; v4: Int = 4;
    v5: Int = 5; v6: Int = 6; v7: Int = 7; v8: Int =8;
    v9: Int = 9; v10: Int = 10; v11: Int = 11; v12: Int = 12;
    v13: Int = 13; v14: Int = 14; v15: Int = 15; v16: Int = 16;
    v17: Int = 17; v18: Int = 18; v19: Int = 19; v20: Int = 20;
    v21: Int = 21; v22: Int = 22; v23: Int = 23; v24: Int = 24;
    v25: Int = 25; v26: Int = 26; v27: Int = 27; v28: Int = 28;
    v29: Int = 29; v30: Int = 30; 
}

contract LongStructHolder {
    big: LongStruct;

    init() {
        self.big = LongStruct{
            v1:11, v2:12, v3:13, v4:14, v5:15, v6:16, v7:17, v8:18,
            v9:19, v10:20, v11:21, v12:22, v13:23, v14:24, v15:25, v16:26,
            v17:27, v18:28, v19:29, v20:30, v21:31, v22:32, v23:33, v24:34,
            v25:35, v26:36, v27:37, v28:38, v29:39, v30:40
        };
    }
}