struct S1 {
    a: Int;
    b: Bool;
    c: String;
}

struct S2 {
    s1: S1;
    d: Address;
}

struct S3 {
    s2: S2;
    e: Cell;
}

contract TestDeeplyNested {
    nested: S3;

    init() {
        self.nested = S3{
            s2: S2{
                s1: S1{
                    a: 10,
                    b: true,
                    c: "hello"
                },
                d: myAddress(),
            },
            e: emptyCell(),
        };
    }
}