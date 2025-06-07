struct TripleNest {
    x: LevelA;
}

struct LevelA {
    y: LevelB;
}

struct LevelB {
    z: LevelC;
}

struct LevelC {
    val: Int;
}

contract TripleNestTest {
    data: TripleNest = TripleNest{
        x: LevelA{
            y: LevelB{
                z: LevelC{
                    val: 123
                }
            }
        }
    };
}