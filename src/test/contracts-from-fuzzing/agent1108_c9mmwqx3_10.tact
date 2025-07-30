struct Level3 {
    q: Int;
}

struct Level2 {
    p: Level3;
}

struct Level1 {
    o: Level2;
}

contract TestContract {
    deep: Level1;

    init() {
        self.deep = Level1{
            o: Level2{
                p: Level3{
                    q: 777
                }
            }
        };
    }
}