// Explicitly test optional nested struct
struct SOpt {
    innerOpt: InnerOpt?;
}

struct InnerOpt {
    foo: Int;
    bar: Bool;
}

contract OptNestedStruct {
    val: SOpt;

    init() {
        self.val = SOpt{innerOpt: null};
    }
}