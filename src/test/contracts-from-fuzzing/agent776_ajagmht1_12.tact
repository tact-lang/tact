struct DeepOptional {
    lev2: Level2?;
}

struct Level2 {
    lev3: Level3?;
}

struct Level3 {
    num: Int;
}

contract DeepOptTest {
    data: DeepOptional;
    init() {
        self.data = DeepOptional{ lev2: null };
    }
}