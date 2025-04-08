struct DeepOptional {
    x: Int?;
}

struct Level2 {
    inner: DeepOptional?;
}

struct Level1 {
    mid: Level2?;
}

contract DeeplyNestedOptionals {
    data: Level1;

    init() {
        self.data = Level1{
            mid: Level2{
                inner: null
            }
        };
    }
}
