struct Level3 {
    flag: Bool;
}

struct Level2 {
    l3: Level3;
    num: Int;
}

struct Level1 {
    str: String;
    l2: Level2;
}

contract TestContract {
    data: Level1;
    init() {
        self.data = Level1{
            str: "hi",
            l2: Level2{
                l3: Level3{flag: true},
                num: 123,
            },
        };
    }
}