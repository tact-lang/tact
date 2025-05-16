struct DeepNestedOpt {
    level1: Level1?;
}

struct Level1 {
    level2: Level2?;
}

struct Level2 {
    level3: Level3?;
}

struct Level3 {
    num: Int;
}

contract TestDeepNestedOpt {
    data: DeepNestedOpt;

    init() {
        self.data = DeepNestedOpt {
            level1: null
        };
    }

    receive() {
        if (self.data.level1 != null) {
            let lvl2 = self.data.level1!!.level2;
            if (lvl2 != null) {
                let lvl3 = lvl2!!.level3;
                if (lvl3 != null) {
                    let _ = lvl3!!.num;
                }
            }
        }
    }
}