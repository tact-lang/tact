struct X { a: Int; }
struct Y { b: Int; }
struct Z {
    f1: X;
    f2: Int;
    f3: Y;
}

contract MultipleStructs {
    val: Z;
    init() {
        self.val = Z{
            f1: X{ a:10 },
            f2: 20,
            f3: Y{ b:30 }
        };
    }
}