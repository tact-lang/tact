struct Level3 {
    c: String;
    d: Bool;
}

struct Level2 {
    a: Level3;
    b: Int?;
}

struct Level1 {
    nested: Level2;
    val: Int;
}

contract DeepNestTest {
    data: Level1;

    init() {
        self.data = Level1{
            nested: Level2{
                a: Level3{
                    c: "hi",
                    d: true,
                },
                b: null,
            },
            val: 7,
        };
    }
}