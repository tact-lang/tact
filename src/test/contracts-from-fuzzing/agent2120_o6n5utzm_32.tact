struct Level2 {
    i: Int?;
}

struct Level1 {
    l2: Level2?;
}

contract DeepOptionals {
    state: Level1?;
    init() {
        self.state = null;
    }
}