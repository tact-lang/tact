struct InnerObj {
    num: Int;
    text: String;
}

struct OuterObj {
    innerObj: InnerObj;
    optInner: InnerObj?;
    optInt: Int?;
    optStr: String?;
    optBool: Bool?;
}

contract ComplexOptions {
    obj: OuterObj;

    init() {
        self.obj = OuterObj{ innerObj: InnerObj{num:1,text:"one"}, optInner:null, optInt:null, optStr:null, optBool:null };
    }
}