struct Level3 {
    deepInt: Int;
    deepOpt: String?;
}

struct Level2 {
    middle: Level3;
}

struct Level1 {
    first: Level2;
}

contract NestedStructs {
    root: Level1;

    init() {
        self.root = Level1{
            first: Level2{
                middle: Level3{
                    deepInt: 55,
                    deepOpt: null,
                },
            },
        };
    }
}
