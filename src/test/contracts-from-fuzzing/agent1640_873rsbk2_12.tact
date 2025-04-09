struct Level3 {
    id: Int;
    flag: Bool;
}

struct Level2 {
    info: Level3;
    note: String;
}

struct Level1 {
    meta: Level2;
    name: String;
}

contract DeepStorage {
    state: Level1;

    init() {
        self.state = Level1{
            meta: Level2{
                info: Level3{id: 123, flag: true},
                note: "deep"
            },
            name: "root"
        };
    }
}