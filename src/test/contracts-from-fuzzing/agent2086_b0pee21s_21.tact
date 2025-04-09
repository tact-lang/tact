struct S1 {
    a: Int;
}

struct S2 {
    a: Int;
    b: Int?;
}

struct S3 {
    x: S1;
    y: S2;
}

contract NestedMixOptional {
    data: S3;

    init() {
        self.data = S3{
            x: S1{a: 1},
            y: S2{a: 2, b: null}
        };
    }
}