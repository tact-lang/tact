struct WithBool {
    f1: Bool;
    f2: Bool;
    f3: Bool;
}

contract Bools {
    x: Bool;
    y: WithBool;

    init() {
        self.x = true;
        self.y = WithBool{
            f1: true,
            f2: false,
            f3: true,
        };
    }
}