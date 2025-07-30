struct Level3 {
    val: Int?;
}

struct Level2 {
    nested: Level3;
    flag: Bool;
}

struct Level1 {
    nested: Level2;
    id: Int;
}

contract DeepNested {
    persist: Level1;

    init() {
        self.persist = Level1{
            nested: Level2{
                nested: Level3{ val: null },
                flag: true
            },
            id: 42
        };
    }
}