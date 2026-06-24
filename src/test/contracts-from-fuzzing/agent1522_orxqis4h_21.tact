struct X {
    a: Int;
    b: Bool;
}

struct Y {
    x1: X;
    x2: X;
}

struct Z {
    y1: Y;
    y2: Y;
}

contract MultipleXY {
    state: Z;

    init() {
        self.state = Z{
            y1: Y{ x1: X{a:1, b:true}, x2: X{a:2,b:false} },
            y2: Y{ x1: X{a:3, b:true}, x2: X{a:4,b:false} },
        };
    }

    receive() {
        let _ = self.state;
    }
}