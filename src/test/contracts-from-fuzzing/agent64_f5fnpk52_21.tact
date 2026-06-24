struct BigNested {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: String?;
    f: Bool?;
}

struct Wrapper {
    nested: BigNested;
    opt: BigNested?;
}

contract BigNestedContract {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            nested: BigNested{
                a: 1,
                b: "b",
                c: true,
                d: null,
                e: null,
                f: null
            },
            opt: null
        };
    }

    receive() {
        self.data.opt = self.data.nested;
    }
}