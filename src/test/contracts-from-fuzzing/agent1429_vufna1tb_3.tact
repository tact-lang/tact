struct Level3 {
    d: String;
}

struct Level2 {
    c: Int?;
    nested3: Level3;
}

struct Level1 {
    a: Int;
    b: Bool;
    nested2: Level2;
}

contract DeepNestedTest {
    data: Level1;

    init() {
        self.data = Level1{
            a: 7,
            b: true,
            nested2: Level2{
                c: null,
                nested3: Level3{
                    d: "hi"
                }
            }
        };
    }
}