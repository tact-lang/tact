struct Level3 {
    inner: String;
}

struct Level2 {
    inner: Level3;
    flag: Bool;
}

struct Level1 {
    inner: Level2;
    num: Int;
    text: String;
}

contract DeepStructNest {
    data: Level1;
    init() {
        self.data = Level1{
            inner: Level2{
                inner: Level3{
                    inner: "ok",
                },
                flag: false,
            },
            num: 100,
            text: "done",
        };
    }
}