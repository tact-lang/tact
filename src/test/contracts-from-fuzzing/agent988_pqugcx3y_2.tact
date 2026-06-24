struct Level3 {
    a: Int;
}

struct Level2 {
    nested3: Level3;
    b: Bool;
}

struct Level1 {
    nested2: Level2;
    s: String;
}

contract DeepTest {
    field: Level1;

    init() {
        self.field = Level1{
            nested2: Level2{
                nested3: Level3{
                    a: 5
                },
                b: true
            },
            s: "deep"
        };
    }
}