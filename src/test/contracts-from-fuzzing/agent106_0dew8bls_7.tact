struct Level3 {
    value: Int;
}

struct Level2 {
    nested3: Level3;
}

struct Level1 {
    nested2: Level2;
}

contract DeeplyNestedStructs {
    data: Level1;

    init() {
        self.data = Level1{nested2: Level2{nested3: Level3{value: 1}}};
    }

    receive() {
        self.data = Level1{nested2: Level2{nested3: Level3{value: self.data.nested2.nested3.value + 1}}};
    }
}