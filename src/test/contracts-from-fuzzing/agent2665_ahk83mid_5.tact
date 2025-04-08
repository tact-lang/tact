struct Inner {
    x: Int;
    y: Int;
}

struct MiddleOptional {
    opt: Inner?;
}

contract OptionalNestedStruct {
    data: MiddleOptional;

    init() {
        self.data = MiddleOptional{
            opt: null
        };
    }
}