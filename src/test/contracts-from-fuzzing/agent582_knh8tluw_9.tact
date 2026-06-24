struct Deep {
    one: Int;
    two: Level2;
}

struct Level2 {
    three: Level3;
    four: Int;
}

struct Level3 {
    val: Int;
    flag: Bool;
}

contract DeepNest {
    data: Deep;

    init() {
        self.data = Deep{
            one: 1,
            two: Level2{
                three: Level3{
                    val: 3,
                    flag: true
                },
                four: 4
            }
        };
    }
}
