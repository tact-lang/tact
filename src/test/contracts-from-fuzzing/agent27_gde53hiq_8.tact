struct Level3 {
    p: Int?;
    q: String;
}

struct Level2 {
    l3: Level3;
    flag: Bool?;
}

struct Level1 {
    l2: Level2;
    count: Int;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            l2: Level2{
                l3: Level3{p: 100, q: "deep"},
                flag: null
            },
            count: 42
        };
    }
}