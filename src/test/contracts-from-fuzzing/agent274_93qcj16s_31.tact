struct DeepOptional {
    nested: Level1?;
}

struct Level1 {
    nested2: Level2?;
}

struct Level2 {
    val: Int;
}

contract OptionalDeepChain {
    optChain: DeepOptional;

    init() {
        self.optChain = DeepOptional{
            nested: Level1{
                nested2: Level2{
                    val: 2024
                }
            }
        };
    }
}