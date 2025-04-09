struct Level4 {
    f4: Int;
}

struct Level3 {
    f3: Int;
    nested: Level4;
}

struct Level2 {
    f2: Int;
    nested: Level3;
}

struct Level1 {
    f1: Int;
    nested: Level2;
}

contract DeepNest {
    receive() {
        let x = Level1{
            f1: 1,
            nested: Level2{
                f2: 2,
                nested: Level3{
                    f3: 3,
                    nested: Level4{
                        f4: 4
                    }
                }
            }
        };
        let sum: Int = x.f1 + x.nested.f2 + x.nested.nested.f3 + x.nested.nested.nested.f4;
        dump(sum);
    }
}
