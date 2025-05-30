struct RecStruct {
    text: String;
    optInt: Int?;
    flag: Bool;
}

contract ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: RecStruct;
    f5: Bool?;
    f6: String?;
    f7: Int?;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "ok";
        self.f4 = RecStruct{ text:"t", optInt:null, flag:false };
        self.f5 = null;
        self.f6 = "zz";
        self.f7 = 42;
    }
}