struct Deep {
    x: Int;
    y: Bool;
}

struct Middle {
    m: Deep;
    n: Bool;
}

contract NestedTest {
    d: Middle;

    init() {
        self.d = Middle{
            m: Deep{ x: 7, y: false },
            n: true
        };
    }
}