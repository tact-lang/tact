struct WithBooleans {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
    flag4: Bool;
}

contract BitsAndPieces {
    flags: WithBooleans;

    init() {
        self.flags = WithBooleans{
            flag1: true,
            flag2: false,
            flag3: true,
            flag4: false
        };
    }
}