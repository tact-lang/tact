struct Level3 {
    f: Int;
}

struct Level2 {
    l: Level3;
}

struct Level1 {
    l: Level2;
}

contract TestContract {
    deep: Level1;

    init() {
        self.deep = Level1{
            l: Level2{
                l: Level3{
                    f: 42
                }
            }
        };
    }
}