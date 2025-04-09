struct Level {
    int1: Int;
    bool1: Bool;
    str1: String;
    int2: Int?;
    bool2: Bool?;
    str2: String?;
}

contract Complex {
    f1: Level;
    f2: Level;
    f3: Level;

    init() {
        self.f1 = Level{int1:1,bool1:true,str1:"a",int2:null,bool2:null,str2:null};
        self.f2 = Level{int1:2,bool1:false,str1:"b",int2:null,bool2:null,str2:null};
        self.f3 = Level{int1:3,bool1:true,str1:"c",int2:null,bool2:null,str2:null};
    }
}