struct Level3 {
    flag: Bool;
    text: String;
}

struct Level2 {
    opt: Level3?;
    number: Int?;
}

struct Level1 {
    inner: Level2;
}

contract TestDeepNest {
    payload: Level1;

    init() {
        self.payload = Level1{
            inner: Level2{
                opt: Level3{
                    flag: true,
                    text: "hello",
                },
                number: null,
            },
        };
    }
}
