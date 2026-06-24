struct S1 {
    a: Int;
}

struct S2 {
    s: S1;
    b: Bool;
}

struct S3 {
    s: S2;
    c: Cell;
}

contract DeepStruct {
    value: S3;

    init() {
        self.value = S3{
            s: S2{
                s: S1{
                    a: 123,
                },
                b: false,
            },
            c: emptyCell(),
        };
    }
}