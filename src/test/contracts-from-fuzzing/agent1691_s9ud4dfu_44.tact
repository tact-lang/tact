struct BooleanAndStrings {
    flag: Bool;
    msg: String;
    optFlag: Bool?;
    optMsg: String?;
}

contract BooleanStringMix {
    data: BooleanAndStrings;

    init() {
        self.data = BooleanAndStrings{
            flag:true, msg:"hi", optFlag:null, optMsg:null
        };
    }
}