struct InnerMost {
    x: Int;
}

struct Level2 {
    z: InnerMost?;
    y: Int;
}

struct Level1 {
    b: Bool;
    l2: Level2;
}

contract MixDeepOptional {
    state: Level1;

    init() {
        self.state = Level1{
            b: false,
            l2: Level2{
                z: null,
                y: 9,
            }
        };
    }
}