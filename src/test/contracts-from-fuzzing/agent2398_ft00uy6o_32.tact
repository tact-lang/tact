struct S1 {
    a: Int;
}
struct S2 {
    a: Int;
}
struct S3 {
    nested1: S1;
    nested2: S2;
}
contract TestContract {
    s: S3;

    init() {
        self.s = S3{
            nested1: S1{ a:1 },
            nested2: S2{ a:2 }
        };
    }
}