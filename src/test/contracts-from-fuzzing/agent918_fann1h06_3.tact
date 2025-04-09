struct Level3 {
    x: Int;
}

struct Level2 {
    y: Int;
    l3: Level3;
}

struct Level1 {
    z: Int;
    l2: Level2;
}

contract TestContract {
    deep: Level1;

    init() {
        self.deep = Level1{
            z: 5,
            l2: Level2{
                y: 4,
                l3: Level3{
                    x: 3
                }
            }
        };
    }
}