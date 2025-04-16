struct Level3 {
    flag: Bool;
}

struct Level2 {
    inner: Level3;
    number: Int?;
}

struct Level1 {
    nested: Level2;
    text: String;
}

contract TestContract {
    complex: Level1;

    init() {
        self.complex = Level1{
            nested: Level2{
                inner: Level3{
                    flag: true,
                },
                number: null,
            },
            text: "deep",
        };
    }
}