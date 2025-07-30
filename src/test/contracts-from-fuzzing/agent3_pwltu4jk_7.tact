struct Level3 {
    q: Int;
    r: Bool?;
}

struct Level2 {
    m: Level3;
    n: String;
}

struct Level1 {
    x: Int;
    y: Level2;
    z: Level3;
}

contract MultiLevels {
    store: Level1;

    init() {
        self.store = Level1{
            x: 7,
            y: Level2{
                m: Level3{q: 1, r: true},
                n: "string"
            },
            z: Level3{q: 9, r: null}
        };
    }
}