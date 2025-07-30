struct Level3 {
    z: Int;
}

struct Level2 {
    y: Int;
    l3: Level3;
}

struct Level1 {
    x: Int;
    l2: Level2;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            x: 1,
            l2: Level2{
                y: 2,
                l3: Level3{z:3}
            }
        };
    }
}