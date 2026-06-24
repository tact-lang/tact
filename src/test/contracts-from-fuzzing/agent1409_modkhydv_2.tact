struct Deep {
    s: Inner;
    n: Int?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract Test {
    d: Deep;

    init() {
        self.d = Deep{
            s: Inner{ x: 1, y: false },
            n: null
        };
    }

    receive() {
        let _ = self.d.s.x;
    }
}