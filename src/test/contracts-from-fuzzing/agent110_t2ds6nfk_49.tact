struct X {
    x: Int?;
}

struct Y {
    y: Int?;
    xx: X;
}

contract NestOpts {
    s: Y;
    init() {
        self.s = Y{ y:null, xx: X{x:null} };
    }
}