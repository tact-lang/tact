struct Level2 {
    x: Int;
    y: Bool;
}

struct Level1 {
    nested: Level2;
    flag: Bool;
}

contract DeepTest {
    data: Level1;

    init() {
        self.data = Level1{
            nested: Level2{
                x: 5,
                y: false,
            },
            flag: true,
        };
    }
}