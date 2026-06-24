struct S1 {
    x: Int;
    y: Bool;
}

struct S2 {
    a: S1;
    b: S1;
}

struct S3 {
    inner: S2;
}

contract Combo {
    data1: S1;
    data2: S2;
    data3: S3;

    init() {
        self.data1 = S1{ x: 1, y: true };
        self.data2 = S2{
            a: S1{ x: 2, y: false },
            b: S1{ x: 3, y: true }
        };
        self.data3 = S3{
            inner: S2{
                a: S1{ x: 4, y: false },
                b: S1{ x: 5, y: true }
            }
        };
    }
}