struct MixNestOpt {
    a: Int?;
    b: String?;
    c: Bool;
}

struct Top {
    nested: MixNestOpt?;
    label: String;
}

contract OptWrap {
    data: Top;
    init() {
        self.data = Top{
            nested: null,
            label: "wrap"
        };
    }
}