struct Level1 {
    a: Int;
    b: Bool;
}

struct Level2 {
    l1: Level1?;
    s: String;
}

struct Level3 {
    l2: Level2;
    flag: Bool?;
}

contract TestStorage {
    state: Level3;

    init() {
        self.state = Level3{
            l2: Level2{
                l1: null,
                s: "deep"
            },
            flag: true
        };
    }
}