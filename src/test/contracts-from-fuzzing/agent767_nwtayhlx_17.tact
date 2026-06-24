struct WrapOpt {
    b1: Bool?;
    b2: Bool?;
    b3: Bool?;
    b4: Bool?;
    b5: Bool?;
}

contract OptManyBools {
    state: WrapOpt;

    init() {
        self.state = WrapOpt{
            b1: true,
            b2: null,
            b3: false,
            b4: null,
            b5: true
        };
    }
}
