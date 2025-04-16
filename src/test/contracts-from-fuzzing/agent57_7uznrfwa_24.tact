struct SOptStruct {
    intf: Int?;
    boolf: Bool?;
    strf: String?;
}

contract MixNestedOptionals {
    sopt1: SOptStruct;
    sopt2: SOptStruct;

    init() {
        self.sopt1 = SOptStruct{intf:null,boolf:null,strf:null};
        self.sopt2 = SOptStruct{intf:null,boolf:null,strf:null};
    }
}