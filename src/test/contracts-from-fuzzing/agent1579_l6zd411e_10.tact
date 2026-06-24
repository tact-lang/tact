struct LevelA {
    a: Int;
}

struct LevelB {
    b: LevelA;
}

struct LevelC {
    c: LevelB;
}

contract NestedMany {
    data: LevelC;

    init() {
        self.data = LevelC{
            c: LevelB{
                b: LevelA{
                    a: 99
                }
            }
        };
    }
    receive() {
        self.data.c.b.a = self.data.c.b.a + 1;
    }
}