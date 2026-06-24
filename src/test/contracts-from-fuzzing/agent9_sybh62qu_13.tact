struct A { i: Int }
struct B { s: String }
struct C { b: Bool }

struct ABC {
    aa: A;
    bb: B?;
    cc: C?;
}

contract DoubleOpt {
    data: ABC?;

    init() {
        self.data = ABC{
            aa: A{ i: 5 },
            bb: null,
            cc: C{ b: true },
        };
    }
}