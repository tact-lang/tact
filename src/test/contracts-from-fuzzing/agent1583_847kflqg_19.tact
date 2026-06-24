struct OptInner {
    s: String?;
    b: Bool?;
}

struct WithInnerOpt {
    opt: OptInner;
    number: Int;
}

contract OptInside {
    data: WithInnerOpt;

    init() {
        self.data = WithInnerOpt{
            opt: OptInner{s:null, b:null},
            number: 0,
        };
    }
}