struct OnlyOpt {
    x: Int?;
    y: Int?;
}

contract AllOptStruct {
    s: OnlyOpt;

    init() {
        self.s = OnlyOpt{
            x: null,
            y: null,
        };
    }
}