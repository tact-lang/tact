struct BigNesting {
    a: Int;
    b: LevelB;
}

struct LevelB {
    x: Int;
    y: LevelC;
}

struct LevelC {
    m: Int;
    n: Bool;
}

contract BigNestTest {
    data: BigNesting = BigNesting{
        a: 1,
        b: LevelB{
            x: 2,
            y: LevelC{
                m: 3,
                n: false
            }
        }
    };
}