struct DeepNested {
    level1: Int;
    level2: InnerDeep;
}

struct InnerDeep {
    subval: Int;
    subopt: Int?;
    subbool: Bool;
}

contract Test3 {
    d: DeepNested;

    init() {
        self.d = DeepNested{
            level1: 10,
            level2: InnerDeep{ subval:11, subopt:null, subbool:false }
        };
    }
}
