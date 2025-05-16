struct LevelA {
    x: Int;
    y: Bool;
}

struct LevelB {
    la: LevelA;
    z: String?;
}

contract TestContract {
    lvb: LevelB;

    init() {
        self.lvb = LevelB{
            la: LevelA{
                x: 7,
                y: false,
            },
            z: null,
        };
    }
}