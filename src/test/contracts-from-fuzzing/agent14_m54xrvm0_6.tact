struct Level3 {
    deep: Int;
}

struct Level2 {
    l3: Level3;
    val: Bool;
}

struct Level1 {
    l2: Level2;
    str: String;
}

contract Test6 {
    nested: Level1;

    init() {
        self.nested = Level1{
            l2: Level2{
                l3: Level3{ deep: 42 },
                val: true
            },
            str: "ok"
        };
    }
}
