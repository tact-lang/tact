struct Mid {
    sub: Bottom;
}

struct Bottom {
    flag: Bool?;
    str: String;
}

contract OptionalInDeep {
    root: Mid;

    init() {
        self.root = Mid{ sub: Bottom{ flag: null, str: "x" } };
    }
}
