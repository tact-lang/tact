struct NestedOptionalStruct {
    a: Int;
    b: InnerOptional?;
}

struct InnerOptional {
    x: Int;
    y: Bool;
}

contract NestedOptionalContract {
    s: NestedOptionalStruct;

    init() {
        self.s = NestedOptionalStruct{
            a: 1,
            b: null
        };
    }
}