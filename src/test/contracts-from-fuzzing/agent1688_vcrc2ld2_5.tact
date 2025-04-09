struct DeepOptional {
    value: Int?;
}

struct Level2 {
    nested: DeepOptional?;
}

contract TestContract {
    data: Level2;
    init() {
        self.data = Level2{
            nested: null
        };
    }
}