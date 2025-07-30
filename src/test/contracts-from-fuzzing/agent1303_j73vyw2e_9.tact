struct OptsAndFlags {
    opt1: Int?;
    opt2: Bool?;
    opt3: Int?;
    opt4: Bool?;
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
}

contract TestContract {
    state: OptsAndFlags;

    init() {
        self.state = OptsAndFlags{
            opt1: null,
            opt2: null,
            opt3: null,
            opt4: null,
            flag1: true,
            flag2: false,
            flag3: true,
        };
    }
}