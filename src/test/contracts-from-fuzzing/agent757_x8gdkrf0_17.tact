struct Level3 {
    x: Int = 3;
}

struct Level2 {
    l3: Level3;
    optL3: Level3? = null;
}

struct Level1 {
    l2: Level2;
}

contract TestContract {
    deep: Level1;

    init() {
        self.deep = Level1{
            l2: Level2{
                l3: Level3{}
            }
        };
    }
}