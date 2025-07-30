struct Level3 {
    flag: Bool;
    count: Int;
}

struct Level2 {
    l3: Level3;
    note: String;
}

struct Level1 {
    l2: Level2;
    amount: Int;
}

contract DeepNested {
    state: Level1;

    init() {
        self.state = Level1{
            l2: Level2{
                l3: Level3{
                    flag: true,
                    count: 123,
                },
                note: "hello",
            },
            amount: 777,
        };
    }
}