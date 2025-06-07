struct HasOpt {
    optInt: Int?;
    optBool: Bool?;
    str: String;
}

contract SetDefaults {
    rec: HasOpt;

    init() {
        self.rec = HasOpt{optInt:null,optBool:true,str:"ok"};
    }
}