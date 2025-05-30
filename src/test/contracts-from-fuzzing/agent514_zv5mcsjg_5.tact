struct Level3 {
    val: Int;
}

struct Level2 {
    sub: Level3;
    flag: Bool;
}

struct Level1 {
    inner: Level2;
    text: String;
}

contract DeepContract {
    deepData: Level1 = Level1{
        inner: Level2{
            sub: Level3{ val: 5 },
            flag: true,
        },
        text: "deep",
    };

    init() {
        self.deepData = Level1{
            inner: Level2{
                sub: Level3{ val: 100 },
                flag: false,
            },
            text: "update",
        };
    }
}