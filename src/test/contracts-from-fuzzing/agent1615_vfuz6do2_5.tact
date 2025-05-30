struct Level3 {
    l3field: Int?;
}

struct Level2 {
    l2field: String;
    l3: Level3;
}

struct Level1 {
    flag: Bool;
    l2: Level2;
    maybeInt: Int?;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            flag: true,
            l2: Level2{
                l2field: "ok",
                l3: Level3 {
                    l3field: null
                }
            },
            maybeInt: 123
        };
    }

    receive() {}
}