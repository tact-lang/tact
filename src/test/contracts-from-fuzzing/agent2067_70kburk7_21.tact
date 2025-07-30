struct S1 {
    a: Int as int64;
}

struct S2 {
    f: S1;
    b: Int as uint4;
}

contract OrderTest {
    data: S2;

    init() {
        self.data = S2{
            f: S1{
                a: 123
            },
            b: 13
        };
    }
}