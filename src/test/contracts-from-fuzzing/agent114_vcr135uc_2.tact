struct DeepNested {
    foo: Level1?;
}

struct Level1 {
    bar: Level2?;
}

struct Level2 {
    baz: Int?;
}

contract TestDeepNested {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            foo: Level1{
                bar: Level2{
                    baz: 123
                }
            }
        };
    }
}
