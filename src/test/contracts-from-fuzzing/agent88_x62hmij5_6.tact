struct S1 {
    x: Int;
}
struct S2 {
    s1: S1;
}
struct S3 {
    s2: S2;
}

contract Chain {
    val: S3;
    init() {
        self.val = S3{ s2: S2{ s1: S1{ x: 99 } } };
    }
    receive() {}
}