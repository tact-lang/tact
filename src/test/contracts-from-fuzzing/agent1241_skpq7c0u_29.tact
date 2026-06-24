struct SmallGaps {
    a: Int as uint2;
    b: Int as uint6;
    c: Int as uint4;
}

contract SmallGapsTest {
    x: SmallGaps;

    init() {
        self.x = SmallGaps{
            a: 3,
            b: 42,
            c: 15,
        };
    }
}
