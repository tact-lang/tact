struct DeepOptionals {
    x: Int?;
    y: LevelOneOption?;
}

struct LevelOneOption {
    z: Int?;
    s: String?;
}

contract TestContract {
    deepOpt: DeepOptionals;

    init() {
        self.deepOpt = DeepOptionals{
            x: null,
            y: LevelOneOption{
                z: null,
                s: null
            }
        };
    }
}