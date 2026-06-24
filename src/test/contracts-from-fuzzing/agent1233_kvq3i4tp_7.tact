struct Level3 {
    z: String;
}

struct Level2 {
    nested3: Level3;
    y: Int;
}

struct Level1 {
    nested2: Level2;
    x: Bool;
}

contract DeepChainTest {
    data: Level1;

    init() {
        self.data = Level1{
            nested2: Level2{
                nested3: Level3{
                    z: "hello"
                },
                y: 42
            },
            x: true
        };
    }
}