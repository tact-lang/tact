struct Level1 {
    a: Int;
    b: Bool;
}

struct Level2 {
    arr: Level1;
    c: String;
}

struct Level3 {
    arr: Level2;
    d: Int?;
}

struct Level4 {
    arr: Level3;
    e: Bool?;
}

contract FourLevels {
    x: Level4;

    init() {
        self.x = Level4{
            arr: Level3{
                arr: Level2{
                    arr: Level1{ a: 1, b: true },
                    c: "yo"
                },
                d: null
            },
            e: null
        };
    }
}