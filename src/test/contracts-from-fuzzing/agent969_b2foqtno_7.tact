struct Level3 {
    val: Int;
    flag: Bool;
}

struct Level2 {
    nested: Level3;
    tag: String;
}

struct Level1 {
    inner: Level2;
}

contract DeepNest {
    data: Level1;

    init() {
        self.data = Level1{
            inner: Level2{
                nested: Level3{
                    val: 42,
                    flag: true
                },
                tag: "deep"
            }
        };
    }
}
