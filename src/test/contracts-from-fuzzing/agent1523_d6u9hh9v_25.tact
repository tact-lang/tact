struct OptBools {
    b1: Bool?;
    b2: Bool?;
    b3: Bool?;
    b4: Bool?;
    b5: Bool?;
}

contract TestOpt {
    opt: OptBools;
    init() {
        self.opt = OptBools{
            b1: true,
            b2: null,
            b3: false,
            b4: null,
            b5: true,
        };
    }
}