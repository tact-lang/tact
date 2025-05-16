struct DeeplyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Slice?;
    e: Cell?;
    f: Address?;
}

struct NestedOptional {
    inner: DeeplyOptional?;
    str: String;
    flag: Bool;
}

contract OptionalInOptional {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            inner: null,
            str: "abc",
            flag: true
        };
    }
}