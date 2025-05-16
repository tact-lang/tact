struct OuterMost {
    x: Int;
    second: Level2;
}

struct Level2 {
    y: Int;
    third: Level3;
}

struct Level3 {
    z: Int;
    flag: Bool;
}

contract MultiDeep {
    val: OuterMost;

    init() {
        self.val = OuterMost{
            x: 10,
            second: Level2{
                y: 20,
                third: Level3{
                    z: 30,
                    flag: true
                }
            }
        };
    }
}
