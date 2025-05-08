struct Inner1 {
    x: Int?;
    y: Int;
}

struct Inner2 {
    a: String;
    b: Bool?;
}

struct Wrap {
    one: Inner1;
    two: Inner2;
    comment: String;
}

contract MultiNestedOpts {
    data: Wrap;
    init() {
        self.data = Wrap{
            one: Inner1{ x: null, y: 5 },
            two: Inner2{ a: "hi", b: null },
            comment: "done"
        };
    }
}
