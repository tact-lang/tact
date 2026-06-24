struct X {
    a: Int;
}

struct Y {
    x1: X;
    x2: X;
    x3: X;
}

contract ManySameStructs {
    val: Y;

    init() {
        self.val = Y{
            x1: X{a: 11},
            x2: X{a: 22},
            x3: X{a: 33}
        };
    }
}