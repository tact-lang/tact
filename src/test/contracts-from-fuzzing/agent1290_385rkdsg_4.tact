struct Level3 {
    value: Int?;
}

struct Level2 {
    nested3: Level3;
    label: String;
}

struct Level1 {
    nested2: Level2;
    flag: Bool;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            nested2: Level2{
                nested3: Level3{ value: null },
                label: "zero"
            },
            flag: false
        };
    }

    receive() {
        self.data = Level1{
            nested2: Level2{
                nested3: Level3{ value: 42 },
                label: "deep"
            },
            flag: true
        };
    }
}