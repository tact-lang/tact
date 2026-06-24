struct Level2 {
    sub1: Int;
    sub2: Int?;
}

struct Level1 {
    nested1: Level2;
    nested2: Level2;
}

contract DeepDupNestedOpt {
    state: Level1;

    init() {
        self.state = Level1{
            nested1: Level2{ sub1: 5, sub2: null },
            nested2: Level2{ sub1: 7, sub2: null }
        };
    }
}