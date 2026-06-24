struct Level3 {
    x: Int;
    y: String;
}

struct Level2 {
    foo: Level3;
    bar: Int;
}

struct Level1 {
    val: Level2;
    flag: Bool;
}

contract DeepNestedStorage {
    store: Level1;

    init() {
        self.store = Level1{
            val: Level2{
                foo: Level3{ x: 42, y: "deep" },
                bar: 7,
            },
            flag: true,
        };
    }
}