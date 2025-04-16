struct OptNested {
    a: Int;
    b: OptInner?;
}

struct OptInner {
    c: Bool;
    d: Int?;
}

contract OptionalNestedStruct {
    val: OptNested;

    init() {
        self.val = OptNested{
            a: 1,
            b: OptInner{
                c: true,
                d: null
            }
        };
    }
}