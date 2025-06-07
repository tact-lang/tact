struct Level2 {
    val: Int;
}

struct Level1 {
    sub1: Level2?;
    sub2: Level2?;
}

contract MultiNestedOpt {
    data: Level1;

    init() {
        self.data = Level1{
            sub1: null,
            sub2: Level2{ val: 55 }
        };
    }
}