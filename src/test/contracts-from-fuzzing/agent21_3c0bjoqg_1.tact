struct DeepNested {
    inner: Nested;
}

struct Nested {
    level2: Level2;
}

struct Level2 {
    nullableInt: Int?;
    someBool: Bool;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            inner: Nested{
                level2: Level2{
                    nullableInt: null,
                    someBool: true
                }
            }
        };
    }
}