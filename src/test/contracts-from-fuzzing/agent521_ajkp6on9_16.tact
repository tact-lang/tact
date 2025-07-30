struct SOpt {
    str: String?;
    int: Int?;
}

contract DefaultVals {
    opt: SOpt = SOpt{
        str: null,
        int: null,
    };

    init() {
        self.opt = SOpt{
            str: "foo",
            int: 9,
        };
    }
}