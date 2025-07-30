struct Level3 {
    val: Int?;
}

struct Level2 {
    l3: Level3;
    status: Bool;
}

struct Level1 {
    text: String;
    lvl2: Level2;
}

contract DeepNest {
    state: Level1 = Level1{
        text: "x",
        lvl2: Level2{
            l3: Level3{ val: null },
            status: true,
        },
    };
    receive() {
        self.state = self.state;
    }
}