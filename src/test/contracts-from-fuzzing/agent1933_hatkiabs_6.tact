struct Level3 {
    flag: Bool;
    note: String;
}

struct Level2 {
    l3: Level3;
    amount: Int;
    optionalText: String?;
}

struct Level1 {
    l2: Level2;
    done: Bool;
}

contract DeeplyNestedOptionals {
    state: Level1;

    init() {
        self.state = Level1{
            l2: Level2{
                l3: Level3{
                    flag: true,
                    note: "test",
                },
                amount: 777,
                optionalText: null,
            },
            done: false,
        };
    }
}