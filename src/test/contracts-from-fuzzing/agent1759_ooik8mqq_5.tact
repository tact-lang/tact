struct Level3 {
    flag: Bool;
    number: Int?;
}

struct Level2 {
    data: Level3;
    txt: String;
}

struct Level1 {
    inner: Level2;
}

contract DeepOptional {
    field: Level1;

    init() {
        self.field = Level1{
            inner: Level2{
                data: Level3{ flag: true, number: null },
                txt: "hello",
            },
        };
    }
}
