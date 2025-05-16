struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    c: String;
    d: Slice;
    s1: S1;
}

struct S3 {
    e: Address;
    f: Cell;
    optS2: S2?;
}

contract ChainNestedStructs {
    data: S3;

    init() {
        self.data = S3{
            e: myAddress(),
            f: emptyCell(),
            optS2: null,
        };
    }
}