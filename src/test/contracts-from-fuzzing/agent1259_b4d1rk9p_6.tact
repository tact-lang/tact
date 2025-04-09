struct Level3 {
    x: Int;
}

struct Level2 {
    inner3: Level3;
    y: Int;
}

struct Level1 {
    inner2: Level2;
    flag: Bool;
}

contract TestContract {
    root: Level1;

    init() {
        self.root = Level1{
            inner2: Level2{
                inner3: Level3{ x: 99 },
                y: 55
            },
            flag: false
        };
    }
}