struct ComboPrimOpt {
    integer: Int;
    maybeStr: String?;
    flag: Bool;
    maybeInt: Int?;
    maybeFlag: Bool?;
}

contract ComboPrimOptTest {
    val: ComboPrimOpt;

    init() {
        self.val = ComboPrimOpt{
            integer:1,
            maybeStr:null,
            flag:true,
            maybeInt:null,
            maybeFlag:false
        };
    }
}
