struct S1 {
    i: Int;
    b: Bool;
    s: String;
}

struct S2 {
    nested: S1;
    comment: String;
}

struct S3 {
    nestedAgain: S2;
    maybeInt: Int?;
}

contract TestContract {
    data: S3;

    init() {
        self.data = S3{
            nestedAgain: S2{
                nested: S1{
                    i: 42,
                    b: false,
                    s: "test",
                },
                comment: "hi",
            },
            maybeInt: null,
        };
    }

    receive() {
        self.data = self.data;
    }
}