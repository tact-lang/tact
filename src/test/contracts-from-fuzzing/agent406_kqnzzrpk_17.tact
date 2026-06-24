struct AS {
    x: Int;
}

struct BS {
    y: AS;
}

struct CS {
    z: BS;
}

struct DS {
    w: CS;
}

contract TestContract {
    d: DS;
    init() {
        self.d = DS{ w: CS{ z: BS{ y: AS{ x: 77 } } } };
    }
}