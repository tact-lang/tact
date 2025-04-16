struct BigNested {
    a: Int;
    s: String;
    opt: Bool?;
    nested: SSub;
}

struct SSub {
    inner: Int;
    flag: Bool;
}

contract ContainingBigNested {
    state: BigNested;

    init() {
        self.state = BigNested{
            a: 1,
            s: "hi",
            opt: true,
            nested: SSub {inner:10, flag:false}
        };
    }
}
