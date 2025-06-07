struct Level3 {
    x: Int?;
    y: String?;
}

struct Level2 {
    inner: Level3;
    flag: Bool;
}

struct Level1 {
    label: String;
    optInner: Level2?;
}

contract TestContract {
    nested: Level1;

    init() {
        self.nested = Level1{
            label: "deep",
            optInner: Level2{
                inner: Level3{
                    x: 123,
                    y: null,
                },
                flag: true,
            },
        };
    }
}
