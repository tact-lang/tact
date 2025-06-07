struct Level4 {
    x: Int?;
}

struct Level3 {
    nested: Level4?;
}

struct Level2 {
    nested: Level3?;
}

struct Level1 {
    nested: Level2?;
}

contract DeepMultiNulls {
    val: Level1 = Level1{nested: Level2{nested: Level3{nested: Level4{x: null}}}};

    receive() {
        self.val = Level1{nested: null};
    }
}