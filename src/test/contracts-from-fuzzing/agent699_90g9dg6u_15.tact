struct InnerOpt {
    s: String?;
    b: Bool?;
    i: Int?;
}

struct Holder {
    a: Int;
    nested: InnerOpt;
    c: Bool;
}

contract OptNest {
    data: Holder;

    init() {
        self.data = Holder{
            a: 5,
            nested: InnerOpt{
                s: null,
                b: true,
                i: null
            },
            c: false
        };
    }
}
