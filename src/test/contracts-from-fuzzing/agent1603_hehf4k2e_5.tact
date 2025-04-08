struct DeepOptionals {
    lvl1: Int?;
    lvl2: Level2?;
}

struct Level2 {
    lvl3: Int?;
    lvl3b: Level3?;
}

struct Level3 {
    leaf: String?;
}

contract DeepOptionalContract {
    data: DeepOptionals;

    init() {
        self.data = DeepOptionals{
            lvl1: null,
            lvl2: Level2{
                lvl3: null,
                lvl3b: Level3{ leaf: "hi" },
            },
        };
    }
}