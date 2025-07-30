struct OptionalStruct {
    a: Int?;
    b: Inner?;
}

struct Inner {
    x: Int;
}

contract NestedOptionals2 {
    s: OptionalStruct;
    init() {
        self.s = OptionalStruct{
            a: null,
            b: null,
        };
    }
}