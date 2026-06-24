struct Level2 {
    flag: Bool;
}

struct Level1 {
    nested: Level2;
}

contract DeepNested {
    data: Level1;

    init() {
        self.data = Level1{nested: Level2{flag: false}};
    }
}
