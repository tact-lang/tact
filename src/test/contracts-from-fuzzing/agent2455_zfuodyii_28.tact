struct BigNested {
    a: Int;
    b: Bool;
    c: String;
    s: Inner;
}

struct Inner {
    d: Int;
    e: Bool;
    f: String;
}

contract BigNestedStruct {
    data: BigNested;

    init() {
        self.data = BigNested{
            a: 1,
            b: true,
            c: "abc",
            s: Inner{
                d: 2,
                e: false,
                f: "xyz"
            }
        };
    }
}