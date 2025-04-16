struct OptionalDeep {
    l1: Level1?;
}

struct Level1 {
    l2: Level2?;
}

struct Level2 {
    l3: Level3?;
}

struct Level3 {
    val: String?;
}

contract TestContract {
    optdeep: OptionalDeep;
    init() {
        self.optdeep = OptionalDeep{
            l1: Level1{
                l2: null
            }
        };
    }
}