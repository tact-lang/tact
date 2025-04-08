struct X {
    a: Int;
    b: Bool?;
}

struct Y {
    s1: X;
    s2: X;
}

contract MultipleOptionals {
    y: Y;

    init() {
        self.y = Y{
            s1: X{a: 1, b: null},
            s2: X{a: 2, b: true},
        };
    }
}