struct Level3 {
    number: Int;
    note: String;
}

struct Level2 {
    mid: Level3;
    flag: Bool;
}

struct Level1 {
    top: Level2;
    name: String;
}

contract ThreeDeep {
    l1: Level1;

    init() {
        self.l1 = Level1{
            top: Level2{
                mid: Level3{
                    number: 123,
                    note: "done"
                },
                flag: true
            },
            name: "entry"
        };
    }
}