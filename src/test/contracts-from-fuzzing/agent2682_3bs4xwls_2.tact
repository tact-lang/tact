struct DeepNested {
    inner: Level2;
}

struct Level2 {
    field: Level3;
}

struct Level3 {
    val: Int;
    name: String;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            inner: Level2{
                field: Level3{
                    val: 123,
                    name: "deep"
                }
            }
        };
    }
}
