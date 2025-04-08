struct Chain3 {
    i1: Int;
    i2: Int;
    i3: Int;
}

struct Level2 {
    c3: Chain3;
}

struct Level1 {
    l2: Level2;
}

contract ChainContract {
    field: Level1;

    init() {
        self.field = Level1{
            l2: Level2{
                c3: Chain3{ i1:1, i2:2, i3:3 }
            }
        };
    }
}
