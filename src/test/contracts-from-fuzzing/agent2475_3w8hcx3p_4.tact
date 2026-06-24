struct NestedOptional {
    innerOpt: Bool?;
    someVal: Int = 1;
}

struct OuterOptional {
    nested: NestedOptional?;
    msg: String;
}

contract OptionalNestContract {
    val: OuterOptional;
    init() {
        self.val = OuterOptional{ nested: null, msg: "hi" };
    }
}