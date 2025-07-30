struct OptionalDeepNest {
    optNest: InnerLevel1?;
}

struct InnerLevel1 {
    optLev2: InnerLevel2?;
}

struct InnerLevel2 {
    optLev3: InnerLevel3?;
}

struct InnerLevel3 {
    val: Int;
}

contract OptionalDeepNestContract {
    data: OptionalDeepNest;

    init() {
        self.data = OptionalDeepNest{
            optNest: InnerLevel1{
                optLev2: InnerLevel2{ optLev3: InnerLevel3{ val:42 } }
            }
        };
    }
}
