struct NestedBool {
    flag: Bool;
    next: Level2;
}

struct Level2 {
    flag: Bool;
    next: Level3;
}

struct Level3 {
    flag: Bool;
}

contract NestedBoolChain {
    state: NestedBool;

    init() {
        self.state = NestedBool {
            flag: true,
            next: Level2 {
                flag: false,
                next: Level3 { flag: true }
            }
        };
    }
}