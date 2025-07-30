struct NestedMany {
    level2: Level2;
    data: Int;
}

struct Level2 {
    level3: Level3;
    flag: Bool;
}

struct Level3 {
    prop1: Int;
    prop2: String;
}

contract TestNestedMany {
    store: NestedMany;

    init() {
        self.store = NestedMany{
            level2: Level2{
                level3: Level3{
                    prop1: 55,
                    prop2: "hello",
                },
                flag: true,
            },
            data: 100,
        };
    }
}