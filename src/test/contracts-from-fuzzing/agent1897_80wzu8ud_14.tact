struct MidOptional {
    inner: Level1?;
}

struct Level1 {
    deeper: Level2?;
}

struct Level2 {
    core: Int;
}

contract MidOptContract {
    data: MidOptional;

    init() {
        self.data = MidOptional{
            inner: Level1{
                deeper: null
            }
        };
    }
}
