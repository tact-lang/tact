struct Base1 {
    f1: Int;
}

struct Base2 {
    f2: Int;
}

struct Combined {
    b1: Base1;
    b2: Base2;
}

contract CombineStructs {
    s: Combined;

    init() {
        self.s = Combined{
            b1: Base1{
                f1: 10,
            },
            b2: Base2{
                f2: 20,
            },
        };
    }
}
