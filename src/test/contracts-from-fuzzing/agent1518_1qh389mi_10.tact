struct NestedOptionalStruct {
    a: Int;
    b: OptionalInside?;
}

struct OptionalInside {
    s: InnerDeep?;
}

struct InnerDeep {
    flag: Bool;
}

contract NestedInside {
    val: NestedOptionalStruct;

    init() {
        self.val = NestedOptionalStruct{
            a: 5,
            b: OptionalInside{ s: InnerDeep{ flag: false } }
        };
    }
}