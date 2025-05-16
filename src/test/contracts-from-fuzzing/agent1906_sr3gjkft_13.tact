struct OptionalS {
    str: String?;
    intv: Int?;
    boolv: Bool?;
}

struct Container {
    s1: OptionalS;
    s2: OptionalS;
}

contract CombineOpts {
    data: Container;

    init() {
        self.data = Container{
            s1: OptionalS{str:null,intv:null,boolv:null},
            s2: OptionalS{str:"x", intv:99, boolv:true},
        };
    }
}
