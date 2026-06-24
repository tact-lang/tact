struct Level3 {
    str: String;
    num: Int;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    inner: Level2;
}

contract DeepStringNest {
    data: Level1;

    init() {
        self.data = Level1{
            inner: Level2{
                inner: Level3{
                    str: "deep",
                    num: 999
                }
            }
        };
    }
}