struct S1 {
    i: Int;
    b: Bool;
}

struct S2 {
    s: S1;
}

struct S3 {
    s: S2;
}

contract CTest {
    data: S3;

    init() {
        self.data = S3{
            s: S2{
                s: S1{
                    i: 123,
                    b: false
                }
            }
        };
    }
}