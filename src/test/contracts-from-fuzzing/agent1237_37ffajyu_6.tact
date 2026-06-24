struct DeepOptional {
    a: Int?;
    b: Bool?;
    s: String?;
    nested: NestedOpt?;
}

struct NestedOpt {
    flag: Bool;
    num: Int;
}

contract Test6 {
    val: DeepOptional;

    init() {
        self.val = DeepOptional {
            a: null,
            b: null,
            s: null,
            nested: null
        };
    }
}