struct DeepOpt {
    level1: Level1?;
}

struct Level1 {
    val: Int;
    next: Level2?;
}

struct Level2 {
    subval: Bool;
}

contract Test24 {
    d: DeepOpt;

    init() {
        self.d = DeepOpt{ level1:null };
    }
}
