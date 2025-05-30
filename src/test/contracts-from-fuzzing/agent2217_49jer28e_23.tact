struct Sub {
    a: Int;
    b: Bool;
}

struct X {
    x1: Sub;
    x2: Bool;
    x3: Int;
}

contract NestedF {
    d: X;

    init() {
        self.d = X{
            x1: Sub{ a:1, b:true },
            x2: false,
            x3: 42
        };
    }
}
