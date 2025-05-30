struct S1 {
    value: Int;
}
struct S2 {
    inner: S1;
}
struct S3 {
    inner: S2;
}
struct S4 {
    inner: S3;
}
struct S5 {
    inner: S4;
}

contract DeepFive {
    level: S5;

    init() {
        self.level = S5{
            inner: S4{
                inner: S3{
                    inner: S2{
                        inner: S1{ value: 42 }
                    }
                }
            }
        };
    }
}