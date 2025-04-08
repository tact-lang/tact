struct DeepStruct {
    level1: Int;
    level2: Int;
    level3: Int;
    level4: Int;
    level5: Int;
    level6: Int;
    level7: Int;
    level8: Int;
    level9: Int;
    level10: Int;
}

contract TestContract {
    a: DeepStruct;
    b: DeepStruct;
    c: DeepStruct;

    init() {
        self.a = DeepStruct{level1:1,level2:2,level3:3,level4:4,level5:5,level6:6,level7:7,level8:8,level9:9,level10:10};
        self.b = DeepStruct{level1:11,level2:12,level3:13,level4:14,level5:15,level6:16,level7:17,level8:18,level9:19,level10:20};
        self.c = DeepStruct{level1:21,level2:22,level3:23,level4:24,level5:25,level6:26,level7:27,level8:28,level9:29,level10:30};
    }
}