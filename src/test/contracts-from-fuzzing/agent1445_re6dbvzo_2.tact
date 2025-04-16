struct Level3 {
    flag: Bool;
    note: String;
    maybeNum: Int?;
}

struct Level2 {
    inner: Level3;
    text: String;
}

struct Level1 {
    inner: Level2;
    number: Int;
}

contract DeepOptionals {
    data: Level1?;

    init() {
        self.data = Level1{
            inner: Level2{
                inner: Level3{
                    flag: true,
                    note: "nested",
                    maybeNum: null,
                },
                text: "deeper",
            },
            number: 123,
        };
    }
}