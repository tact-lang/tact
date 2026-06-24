struct Level3 {
    done: Bool;
}

struct Level2 {
    lvl3: Level3;
}

struct Level1 {
    lvl2: Level2;
}

contract DeepNestedStructField {
    nested: Level1 = Level1{lvl2: Level2{lvl3: Level3{done: true}}};

    receive() {
        self.nested = Level1{lvl2: Level2{lvl3: Level3{done: false}}};
    }
}