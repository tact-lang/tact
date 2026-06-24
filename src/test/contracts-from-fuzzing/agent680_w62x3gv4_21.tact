struct Deep {
    a: Int;
    b: Int;
}

struct Wrap {
    d1: Deep;
    d2: Deep;
}

contract PartialDefaultsTest {
    w: Wrap = Wrap{
        d1: Deep{a:1,b:2},
        d2: Deep{a:3,b:4}
    };

    count: Int;

    init() {
        self.count = 100;
    }

    receive() {
        let _ = self.w.d1.a + self.count;
    }
}