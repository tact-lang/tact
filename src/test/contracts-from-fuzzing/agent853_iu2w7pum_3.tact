struct Level3 {
    innermost: Int?;
}

struct Level2 {
    middleOpt: Level3?;
}

contract OptionalNested {
    topOpt: Level2?;

    init() {
        self.topOpt = null;
    }
}