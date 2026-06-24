struct Level3 {
    z: Int;
}

struct Level2 {
    y: Bool;
    nested: Level3;
}

struct Level1 {
    x: String;
    embed: Level2;
}

contract NestedTest {
    data: Level1;

    init() {
        self.data = Level1{
            x: "hello",
            embed: Level2{
                y: false,
                nested: Level3{z: 999}
            }
        };
    }
}