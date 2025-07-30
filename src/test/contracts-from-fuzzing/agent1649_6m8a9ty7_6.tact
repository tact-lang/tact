struct Level3 {
    info: String?;
    number: Int;
}

struct Level2 {
    l3: Level3;
    flag: Bool?;
}

struct Level1 {
    l2: Level2;
    text: String;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            l2: Level2{
                l3: Level3{
                    info: "deep",
                    number: 42,
                },
                flag: false,
            },
            text: "hi",
        };
    }
}