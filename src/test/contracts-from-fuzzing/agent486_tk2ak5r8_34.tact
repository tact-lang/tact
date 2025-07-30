struct OptionalDepth {
    opt1: Level1?;
}

struct Level1 {
    opt2: Level2?;
}

struct Level2 {
    opt3: Level3?;
}

struct Level3 {
    opt4: Int?;
}

contract TestOptionalDepth {
    data: OptionalDepth;

    init() {
        self.data = OptionalDepth{
            opt1: null
        };
    }
}