struct DeepOpt {
    a: Int?;
    b: Bool?;
}

struct VeryDeep {
    d1: DeepOpt;
    d2: DeepOpt;
    d3: DeepOpt;
}

contract UsesVeryDeep {
    d: VeryDeep;

    init() {
        self.d = VeryDeep{
            d1: DeepOpt{a:null,b:true},
            d2: DeepOpt{a:42,b:null},
            d3: DeepOpt{a:null,b:null}
        };
    }
}