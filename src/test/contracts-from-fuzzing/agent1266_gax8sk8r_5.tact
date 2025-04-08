struct Level3 {
    val: Int?;
}

struct Level2 {
    inner: Level3;
    flag: Bool;
}

struct Level1 {
    sub: Level2;
    note: String?;
}

contract DeepDefault {
    data: Level1 = Level1{
        sub: Level2{
            inner: Level3{val: null},
            flag: true
        },
        note: "hi"
    };

    init() {}
}