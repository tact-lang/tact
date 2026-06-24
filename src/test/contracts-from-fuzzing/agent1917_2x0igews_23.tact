struct X {
    a: Int = 1;
    b: Bool = false;
    c: String = "x";
}

struct Y {
    x1: X;
    x2: X;
    x3: X;
}

contract MultipleDefaults {
    param: Y;

    init() {
        self.param = Y{
            x1: X{},
            x2: X{},
            x3: X{},
        };
    }
}
