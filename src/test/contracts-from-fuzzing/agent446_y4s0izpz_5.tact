struct Toggle {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
    optFlag: Bool?;
}

contract Test {
    t: Toggle;

    init() {
        self.t = Toggle{
            flag1: true,
            flag2: false,
            flag3: true,
            optFlag: null,
        };
    }
}