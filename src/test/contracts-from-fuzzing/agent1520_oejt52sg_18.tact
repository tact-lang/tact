struct LevelOne {
    nestedOption: LevelTwo?;
}

struct LevelTwo {
    nestedBool: Bool?;
    nestedInt: Int?;
}

contract NestedNull {
    x: LevelOne;
    init() {
        self.x = LevelOne{
            nestedOption: LevelTwo{
                nestedBool: null,
                nestedInt: null
            }
        };
    }
}