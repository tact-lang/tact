struct RepeatStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
}

contract MultiRepeat {
    f1: RepeatStruct;
    f2: RepeatStruct;
    f3: RepeatStruct;

    init() {
        self.f1 = RepeatStruct{a:1,b:true,c:"x",d:null,e:null};
        self.f2 = RepeatStruct{a:2,b:false,c:"y",d:null,e:null};
        self.f3 = RepeatStruct{a:3,b:true,c:"z",d:null,e:null};
    }
}
