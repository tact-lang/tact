struct Level3 {
    x: Int;
}

struct Level2 {
    inner: Level3;
    flag: Bool;
}

struct Level1 {
    inner: Level2;
}

contract DeepStruct {
    storage: Level1;

    init() {
        self.storage = Level1{
            inner: Level2{
                inner: Level3{
                    x: 999
                },
                flag: true
            }
        };
    }
}