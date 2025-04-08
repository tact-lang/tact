struct ParamS {
    val: Int;
}

struct Wrap {
    param: ParamS;
}

contract Test {
    w: Wrap;

    init() {
        self.w = Wrap{
            param: ParamS{ val: 42 }
        };
    }
}