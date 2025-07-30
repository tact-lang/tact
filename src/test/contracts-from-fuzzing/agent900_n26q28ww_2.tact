struct Inner {
    x: Int;
    y: Int?;
}

struct Outer {
    s: Inner;
    flag: Bool?;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer { s: Inner{ x:5, y:null }, flag: null };
    }

    receive() {
        self.data = Outer {
            s: Inner { x:self.data.s.x + 1, y: 100 },
            flag: true
        };
    }
}