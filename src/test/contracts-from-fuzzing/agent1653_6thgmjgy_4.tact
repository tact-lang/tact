struct Level3 {
    value: Int;
    note: String;
}

struct Level2 {
    l3: Level3;
    flag: Bool?;
}

struct Level1 {
    l2: Level2;
    desc: String;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            l2: Level2{
                l3: Level3{value: 42, note: "deep"},
                flag: true
            },
            desc: "test"
        };
    }
}