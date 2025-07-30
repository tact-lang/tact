struct LVL3 {
    val: Int?;
}

struct LVL2 {
    lvl3: LVL3?;
}

struct LVL1 {
    lvl2: LVL2?;
}

contract DeepOptNesting {
    pstate: LVL1;

    init() {
        self.pstate = LVL1 { lvl2: null };
    }
}
