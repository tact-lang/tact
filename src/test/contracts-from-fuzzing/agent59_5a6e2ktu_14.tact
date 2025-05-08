struct S1 {
    x: Int;
}

struct S2 {
    a: S1;
}

struct S3 {
    b: S2;
}

struct S4 {
    c: S3;
}

struct S5 {
    d: S4;
}

contract Nested5 {
    data: S5;

    init() {
        self.data = S5{
            d: S4{
                c: S3{
                    b: S2{
                        a: S1{ x: 1 }
                    }
                }
            }
        };
    }
}