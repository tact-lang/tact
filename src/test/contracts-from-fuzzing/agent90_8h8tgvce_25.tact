struct Level3 {
    x: Int?;
    y: Bool;
}

struct Level2 {
    lv3: Level3;
    s: String?;
}

struct Level1 {
    l2: Level2;
    a: Address?;
}

contract TestStorage {
    nested: Level1 = Level1{
        l2: Level2{
            lv3: Level3{ x: null, y: false },
            s: null
        },
        a: null
    };

    receive() {}
}