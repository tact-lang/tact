struct OptOpt {
    a: Int?;
    b: Bool?;
}

contract TwoOptStruct {
    s: OptOpt;

    init() {
        self.s = OptOpt {
            a: null,
            b: null,
        };
    }
}