struct Sub {
    a: Int;
}

struct MiddleOpt {
    s: Sub?;
    b: Bool;
}

contract OptionalNestedStruct {
    val: MiddleOpt;

    init() {
        self.val = MiddleOpt{
            s: Sub{a: 42},
            b: true
        };
    }
}