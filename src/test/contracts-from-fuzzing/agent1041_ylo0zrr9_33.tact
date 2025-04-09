struct InnerMostS {
    num: Int;
    opt: Int?;
    flag: Bool;
}

struct InnerS {
    info: InnerMostS;
    str: String?;
}

struct MiddleS {
    inner: InnerS;
}

contract DeepOptionalsCont {
    container: MiddleS;

    init() {
        self.container = MiddleS{
            inner: InnerS{
                info: InnerMostS{ num:5, opt:null, flag:true },
                str:null
            }
        };
    }
}
