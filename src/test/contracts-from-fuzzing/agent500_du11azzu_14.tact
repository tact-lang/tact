struct LevelB {
    valb: Int?;
}

struct LevelA {
    vala: LevelB?;
}

contract OptDeeps {
    rec: LevelA;
    init() {
        self.rec = LevelA{ vala: null };
    }
    receive() {}
}