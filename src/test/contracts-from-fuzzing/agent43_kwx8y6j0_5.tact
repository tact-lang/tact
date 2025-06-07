struct Level3 {
    deepValue: Int?;
}

struct Level2 {
    nestedOpt: Level3?;
}

struct Level1 {
    topOpt: Level2?;
}

contract TestContract {
    compound: Level1;

    init() {
        self.compound = Level1{ topOpt: null };
    }
}