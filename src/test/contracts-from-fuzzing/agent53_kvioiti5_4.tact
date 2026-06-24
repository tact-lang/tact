struct Level3 {
    deep: Bool;
}

struct Level2 {
    next: Level3;
}

struct Level1 {
    next: Level2;
}

contract NestedChain {
    nested: Level1;
    init() {
        self.nested = Level1{ next: Level2{ next: Level3{ deep: true } } };
    }
}