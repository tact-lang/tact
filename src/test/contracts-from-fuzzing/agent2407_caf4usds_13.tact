struct DeeplyOptional {
    level1: Int?;
    level2: Level2?;
}

struct Level2 {
    foo: Int?;
    bar: Bool?;
}

contract TestContract {
    data: DeeplyOptional;

    init() {
        self.data = DeeplyOptional{
            level1: null,
            level2: null,
        };
    }
}