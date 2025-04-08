struct MultiOpt {
    opt1: Int?;
    opt2: Bool?;
    opt3: Address?;
    opt4: String?;
}

contract Test {
    m: MultiOpt;

    init() {
        self.m = MultiOpt {
            opt1: null,
            opt2: null,
            opt3: null,
            opt4: null
        };
    }

    receive() {}
}