struct X {
    i: Int;
}

struct Y {
    a: X;
    b: X;
    c: X;
}

contract TestContract {
    state: Y;
    init() {
        self.state = Y{
            a: X{i:1},
            b: X{i:2},
            c: X{i:3},
        };
    }
}
