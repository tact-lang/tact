struct Level3 {
    a: Int;
    b: Bool?;
}

struct Level2 {
    c: Level3;
    d: Int;
}

struct Level1 {
    e: Level2;
    f: Bool;
}

contract Test7 {
    data: Level1;
    init() {
        self.data = Level1{
            e: Level2{
                c: Level3{a:1, b:null},
                d:2
            },
            f: true
        };
    }
}