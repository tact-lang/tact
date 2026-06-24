struct X {
    p: Int;
    q: String?;
}

struct Y {
    x1: X;
    x2: X;
    n: Int;
}

contract Embed {
    y: Y;
    init() {
        self.y = Y{
            x1: X{p:1,q:null},
            x2: X{p:2,q:"ok"},
            n: 5
        };
    }
}
