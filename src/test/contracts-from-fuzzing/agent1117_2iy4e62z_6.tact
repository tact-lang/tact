struct Base1 {
    a: Int;
}

struct Base2 {
    b: Bool;
}

struct Combined {
    f1: Base1;
    f2: Base2;
}

contract NestedStructs {
    combined: Combined;

    init() {
        self.combined = Combined{
            f1: Base1{a: 42},
            f2: Base2{b: true},
        };
    }
}
