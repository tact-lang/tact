struct InnerOpt {
    maybe: Int?;
}

struct Wrap {
    inside: InnerOpt;
}

contract DefaultInWrap {
    w: Wrap;

    init() {
        self.w = Wrap{ inside: InnerOpt{ maybe:null } };
    }
}