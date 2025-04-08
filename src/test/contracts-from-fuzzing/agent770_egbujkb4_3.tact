struct Level3 {
    a: Int;
    b: Bool;
}

struct Level2 {
    inner: Level3;
    val: Int;
}

struct Level1 {
    nested: Level2;
    flag: Bool;
}

contract DeepNested {
    data: Level1;

    init() {
        self.data = Level1{
            nested: Level2{
                inner: Level3{
                    a: 10,
                    b: true,
                },
                val: 20,
            },
            flag: false,
        };
    }
}
