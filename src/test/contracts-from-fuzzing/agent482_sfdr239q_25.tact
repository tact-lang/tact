struct Deep {
    num: Int as uint8;
    maybeFlag: Bool?;
}

struct Mid {
    sub: Deep?;
    label: String;
}

struct Top {
    midOpt: Mid?;
    bigNum: Int as uint128;
}

contract DeepMixOpt {
    state: Top?;

    init() {
        self.state = null;
    }
}
