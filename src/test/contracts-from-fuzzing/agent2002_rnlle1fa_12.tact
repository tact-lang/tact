struct OptionalsDeep {
    a: Int?;
    b: String?;
    c: Bool?;
}

struct WrapperOpt {
    inside: OptionalsDeep?;
    flag: Bool;
}

contract NestOptDeep {
    state: WrapperOpt;

    init() {
        self.state = WrapperOpt{
            inside: OptionalsDeep{
                a:5,b:"x",c:true
            },
            flag: false
        };
    }
}
