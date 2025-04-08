struct Level2 {
    optionalInt: Int?;
    flag: Bool;
}

struct Level1 {
    optStruct: Level2?;
}

contract OptionalNestedStruct {
    state: Level1;

    init() {
        self.state = Level1 { optStruct: null };
    }
}