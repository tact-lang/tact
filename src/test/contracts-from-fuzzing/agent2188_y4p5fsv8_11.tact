struct DeepOpt {
    f1: Int?;
    f2: NestedOpt;
}

struct NestedOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptDeep {
    val: DeepOpt;
    init() {
        self.val = DeepOpt{
            f1: null,
            f2: NestedOpt{
                a: null,
                b: null,
                c: null,
            },
        };
    }
}