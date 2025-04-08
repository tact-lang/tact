struct Level3 {
    val: Int?;
}

struct Level2 {
    l3: Level3;
    b: Bool;
}

struct Level1 {
    l2: Level2;
    text: String;
}

contract DeepContract {
    state: Level1;

    init() {
        self.state = Level1{
            l2: Level2{
                l3: Level3{ val: null },
                b: true
            },
            text: "deep nesting"
        };
    }
}