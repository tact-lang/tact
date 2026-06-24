struct Innermost {
    val: Int;
}

struct MiddleOptional {
    nested: Innermost?;
}

struct OuterWrap {
    middle: MiddleOptional;
}

contract OptNestedWrap {
    storage: OuterWrap;

    init() {
        self.storage = OuterWrap{
            middle: MiddleOptional{ nested: null }
        };
    }
}