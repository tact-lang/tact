struct S1 {
    a: Int;
}

struct S2 {
    b: S1;
}

struct S3 {
    c: S2;
}

contract Test {
    deep: S3;

    init() {
        self.deep = S3{c: S2{b: S1{a: 5}}};
    }
}