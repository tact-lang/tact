struct MultiLevel {
    a: Int;
    nest1: Level1;
}

struct Level1 {
    b: Bool;
    nest2: Level2;
}

struct Level2 {
    s: String;
    flag: Bool?;
}

contract MultiLevelStore {
    store: MultiLevel;
    init() {
        self.store = MultiLevel{
            a: 1,
            nest1: Level1{
                b: true,
                nest2: Level2{
                    s: "hi",
                    flag: null
                }
            }
        };
    }
}