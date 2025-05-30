struct Deep {
    s1: Level1;
}

struct Level1 {
    s2: Level2;
}

struct Level2 {
    s3: Level3;
}

struct Level3 {
    s4: Level4;
}

struct Level4 {
    value: Int;
}

contract TestContract {
    root: Deep;

    init() {
        self.root = Deep{
            s1: Level1{
                s2: Level2{
                    s3: Level3{
                        s4: Level4{ value: 123 }
                    }
                }
            }
        };
    }
}