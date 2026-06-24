struct S1 {
    a: Int;
    b: Bool;
    c: Slice;
}

struct S2 {
    s: S1;
    d: String;
}

struct S3 {
    t: S2;
    e: Address;
}

contract Mix {
    val: S3;

    init() {
        self.val = S3{
            t: S2{
                s: S1{
                    a: 1,
                    b: true,
                    c: emptyCell().asSlice(),
                },
                d: "hi",
            },
            e: myAddress(),
        };
    }
}