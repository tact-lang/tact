struct Level3 {
    q: Int;
    w: String;
}

struct Level2 {
    n: Bool;
    inn: Level3;
}

struct Level1 {
    flag: Bool;
    nested: Level2;
}

contract DeepNest {
    info: Level1;

    init() {
        self.info = Level1{
            flag: true,
            nested: Level2{
                n: false,
                inn: Level3{ q: 33, w: "nest" }
            }
        };
    }
}