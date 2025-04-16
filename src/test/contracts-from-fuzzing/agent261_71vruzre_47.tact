struct DeepWithOptional {
    nest1: Level1?;
}

struct Level1 {
    nest2: Level2?;
}

struct Level2 {
    val: Int;
}

contract DeepOptionalChain {
    root: DeepWithOptional;

    init() {
        self.root = DeepWithOptional{
            nest1: Level1 {
                nest2: Level2 { val: 101 }
            }
        };
    }

    receive() {
        if (self.root.nest1 != null && self.root.nest1!!.nest2 != null) {
            let _ = self.root.nest1!!.nest2!!.val;
        }
    }
}