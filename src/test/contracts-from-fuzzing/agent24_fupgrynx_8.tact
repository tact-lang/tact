struct S1 {
    x: Int;
}

struct S2 {
    y: Int;
}

struct Top {
    a: S1;
    b: S2;
}

contract TestMultipleStructs {
    t: Top;

    init() {
        self.t = Top{
            a: S1{x: 1},
            b: S2{y: 2}
        };
    }
}