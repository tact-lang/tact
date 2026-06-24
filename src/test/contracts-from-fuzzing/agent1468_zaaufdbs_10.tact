struct S1 {
    x: Int;
    y: Int;
}

struct S2 {
    a: S1;
    b: S1;
}

struct S3 {
    first: S2;
    second: S2;
}

contract TestDeepMulti {
    val: S3;

    init() {
        self.val = S3{
            first: S2{ a: S1{ x:1, y:2 }, b: S1{ x:3, y:4 } },
            second: S2{ a: S1{ x:5, y:6 }, b: S1{ x:7, y:8 } },
        };
    }
}