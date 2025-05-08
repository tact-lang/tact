struct Level1 {
    x: Int;
}

struct Level2 {
    nested: Level1;
}

struct Level3 {
    nested: Level2;
}

contract ThreeLevelNested {
    data: Level3 = Level3{nested: Level2{nested: Level1{x: 123}}};

    receive() {
        let d = self.data;
    }
}