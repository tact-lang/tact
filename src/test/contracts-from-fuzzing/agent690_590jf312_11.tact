struct NestedDeepOption {
    nest: Level2?;
}

struct Level2 {
    deeper: Level3?;
}

struct Level3 {
    val: Int?;
}

contract DeepOpt {
    persistent: NestedDeepOption;

    init() {
        self.persistent = NestedDeepOption{
            nest: Level2{
                deeper: Level3{
                    val: null
                }
            }
        };
    }
}