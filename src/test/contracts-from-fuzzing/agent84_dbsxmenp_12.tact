struct TwoLevel {
    x: Int;
    y: InnerS;
}

struct InnerS {
    flag: Bool?;
    msg: String?;
}

contract TwoLevelOpt {
    data: TwoLevel;
    init() {
        self.data = TwoLevel{
            x: 5,
            y: InnerS{
                flag: null,
                msg: null,
            }
        };
    }
}
