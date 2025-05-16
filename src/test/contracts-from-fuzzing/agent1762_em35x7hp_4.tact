struct NestedOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Holder {
    inner: NestedOptional?;
}

contract OptNesting {
    s: Holder;

    init() {
        self.s = Holder{
            inner: NestedOptional{
                a: 5,
                b: false,
                c: "abc",
            },
        };
    }
}