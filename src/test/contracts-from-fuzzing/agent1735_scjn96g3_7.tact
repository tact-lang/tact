struct Level2 {
    val2: Int;
    val3: Int;
}

struct Level1 {
    root: Int;
    nested: Level2;
}

contract TestContract {
    data1: Level1;
    data2: Level1;

    init() {
        self.data1 = Level1{
            root: 10,
            nested: Level2{ val2: 20, val3: 30 }
        };
        self.data2 = Level1{
            root: 100,
            nested: Level2{ val2: 200, val3: 300 }
        };
    }
}
