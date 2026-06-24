struct Level2S {
    innerOpt: Int?;
}

struct Level1S {
    nested: Level2S?;
}

contract OptNestedMulti {
    data: Level1S;

    init() {
        self.data = Level1S{
            nested: Level2S{
                innerOpt: null
            }
        };
    }
}