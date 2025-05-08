struct Level2 {
    val1: Int;
    val2: Bool?;
}

struct Level1 {
    innerOpt: Level2?;
    b: Bool;
}

contract OptNested {
    data: Level1;

    init() {
        self.data = Level1{
            innerOpt: null,
            b: true
        };
    }
}