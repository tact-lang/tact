struct DeepOptional {
    foo: Int?;
    bar: String?;
    flag: Bool;
}

struct OuterOpt {
    nested: DeepOptional?;
}

contract OptWrap {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{ nested: null };
    }
}