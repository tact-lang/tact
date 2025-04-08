struct Level3 {
    deep: Bool = true;
}

struct Level2 {
    third: Level3;
}

struct Level1 {
    second: Level2;
}

contract DeepNested {
    nested: Level1;

    init() {
        self.nested = Level1{ second: Level2{ third: Level3{} } };
    }

    receive() {}
}