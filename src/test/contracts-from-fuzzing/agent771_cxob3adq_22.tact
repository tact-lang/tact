struct LevelC {
    val: Int;
    title: String;
}

struct LevelB {
    inner: LevelC;
    optNote: String?;
}

struct LevelA {
    middle: LevelB;
    flag: Bool;
}

contract NestedGroups {
    state: LevelA = LevelA{
        middle: LevelB{ inner: LevelC{ val: 8, title: "eight" }, optNote: null },
        flag: true
    };

    init() {
        self.state = LevelA{
            middle: LevelB{ inner: LevelC{ val: 88, title: "EIGHT" }, optNote: "Set" },
            flag: false
        };
    }
}