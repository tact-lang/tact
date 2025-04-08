struct X { a: Int; }

struct Y {
    x1: X;
    x2: X;
    x3: X;
    optX: X?;
}

struct Z {
    y: Y;
    optY: Y?;
    i: Int;
    optStr: String?;
}

contract Test {
    field: Z;

    init() {
        self.field = Z{
            y: Y{ x1:X{a:1}, x2:X{a:2}, x3:X{a:3}, optX:null },
            optY: null,
            i: 5,
            optStr: null
        };
    }
}
