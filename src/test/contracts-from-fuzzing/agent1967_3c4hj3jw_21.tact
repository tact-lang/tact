struct S1 {
    a: Int;
    b: Bool;
}
struct S2 {
    c: Int;
    d: Bool;
}
struct S3 {
    e: S1;
    f: S2;
}
contract TestContract {
    big: S3;

    init() {
        self.big = S3{
            e: S1{a: 1, b: true},
            f: S2{c: 2, d: false}
        };
    }
}
