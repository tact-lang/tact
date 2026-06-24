struct Level2 {
    q: Int;
    r: Bool;
}

struct Level1 {
    m: Int;
    n: Level2;
}

contract NestedTest {
    nested: Level1;

    init() {
        self.nested = Level1{
            m: 5,
            n: Level2{ q: 9, r: true }
        };
    }

    receive() {
        self.nested = Level1{
            m: self.nested.m + 1,
            n: Level2{
                q: self.nested.n.q * 2,
                r: !self.nested.n.r,
            }
        };
    }
}