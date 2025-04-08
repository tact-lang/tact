struct Level3 {
    leaf: Int;
}

struct Level2 {
    mid: Level3?;
}

struct Level1 {
    inner: Level2;
    flag: Bool?;
}

contract Test17 {
    data: Level1;

    init() {
        self.data = Level1{
            inner: Level2{
                mid: null,
            },
            flag: null,
        };
    }
}