struct Level3 {
    k: Bool;
}

struct Level2 {
    j: Level3;
}

struct Level1 {
    i: Level2;
}

contract DeepNestingContract {
    nested: Level1;

    init() {
        self.nested = Level1{i: Level2{j: Level3{k: true}}};
    }
}