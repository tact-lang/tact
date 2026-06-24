struct InnerOpt {
    v: Int?;
}

struct MiddleOpt {
    i: InnerOpt?;
}

contract OptionalCascade {
    root: MiddleOpt;

    init() {
        self.root = MiddleOpt{
            i: InnerOpt{v:null}
        };
    }
}
