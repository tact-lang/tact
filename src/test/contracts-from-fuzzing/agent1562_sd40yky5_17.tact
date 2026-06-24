struct EmbeddedOpt {
    x: Int;
    y: Int?;
}

struct Wrap {
    a: EmbeddedOpt;
    b: EmbeddedOpt?;
}

contract TestContract {
    w: Wrap;
    init() {
        self.w = Wrap{
            a: EmbeddedOpt{x:1, y:null},
            b: null,
        };
    }
}