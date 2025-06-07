struct SOptional { 
    a: Int?; 
}

struct MixedDefaults {
    sopt: SOptional?;
    s: SOptional;
    num: Int;
    optNum: Int?;
    flag: Bool;
    optFlag: Bool?;
    text: String;
    optText: String?;
}

contract ManyOptionalsLayered {
    storage: MixedDefaults;

    init() {
        self.storage = MixedDefaults{
            sopt:null,
            s:SOptional{a:null},
            num:42,
            optNum:null,
            flag:true,
            optFlag:null,
            text:"abc",
            optText:null,
        };
    }
}
