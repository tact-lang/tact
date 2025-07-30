struct Level2 {
    value: String;
}

struct Level1 {
    lvl2: Level2;
}

contract Test {
    deepNested: Level1;

    init() {
        self.deepNested = Level1{lvl2: Level2{value: "hi"}};
    }
}
