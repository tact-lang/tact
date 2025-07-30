struct Level3 {
    propA: Int?;
    propB: Bool?;
    propC: String?;
}

struct Level2 {
    deep: Level3?;
    mark: Bool;
}

struct Level1 {
    nested: Level2?;
    score: Int;
}

contract DeepOptionals {
    maybeData: Level1?;

    init() {
        self.maybeData = Level1{
            nested: Level2{
                deep: Level3{
                    propA: null,
                    propB: null,
                    propC: null,
                },
                mark: false,
            },
            score: 0,
        };
    }
}