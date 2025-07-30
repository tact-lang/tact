struct Level3 {
    data: Int?;
}

struct Level2 {
    nested: Level3;
    flag: Bool;
}

struct Level1 {
    inner: Level2;
}

contract MultiLevel {
    state: Level1;

    init() {
        self.state = Level1{
            inner: Level2{
                nested: Level3{data: null},
                flag: true
            }
        };
    }
}
