struct InnerOpt {
    optInt: Int?;
    optStr: String?;
    optBool: Bool?;
}

struct Container {
    one: InnerOpt;
    two: InnerOpt;
    three: InnerOpt;
}

contract Test {
    cont: Container;

    init() {
        self.cont = Container{
            one: InnerOpt{ optInt:null, optStr:null, optBool:null },
            two: InnerOpt{ optInt:null, optStr:null, optBool:null },
            three: InnerOpt{ optInt:null, optStr:null, optBool:null },
        };
    }
}