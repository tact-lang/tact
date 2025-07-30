struct Level3 {
    a: Int?;
    b: Bool;
}

struct Level2 {
    x: Level3;
    y: Int;
    z: Bool?;
}

contract OptionNested {
    deepOpt: Level2?;

    init() {
        self.deepOpt = Level2{
            x: Level3{
                a: null,
                b: true
            },
            y: 55,
            z: null
        };
    }
}