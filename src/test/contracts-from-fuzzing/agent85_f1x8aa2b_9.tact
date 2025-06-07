struct S1 {
    a: Int;
}
struct S2 {
    sa: S1;
}
struct S3 {
    sb: S2;
}

contract VeryDeepNested {
    deep: S3;

    init() {
        self.deep = S3{ sb: S2{ sa: S1{ a: 123 } } };
    }

    receive() {}
}