struct Level2 {
    x: Int;
    y: Int?;
}

struct Level1 {
    a: Level2?;
}

contract TopLevelOptional {
    opt: Level1;

    init() {
        self.opt = Level1{
            a: Level2{
                x: 5,
                y: null
            }
        };
    }
}