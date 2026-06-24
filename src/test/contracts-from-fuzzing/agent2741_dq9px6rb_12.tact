struct S1 {
    x: Int;
}

struct S2 {
    y: Bool;
}

struct S3 {
    a: S1;
    b: S2;
}

contract NestedFlat {
    val: S3;

    init() {
        self.val = S3{ a: S1{ x:10 }, b: S2{ y:true } };
    }
}