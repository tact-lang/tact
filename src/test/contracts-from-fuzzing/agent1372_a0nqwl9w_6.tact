struct InnerMost {
    a: Int;
    b: Bool;
}

struct MiddleOptional {
    optField: InnerMost?;
    str: String;
}

struct OuterOptional {
    middle: MiddleOptional?;
    x: Int;
}

contract TestContract {
    data: OuterOptional;
    init() {
        self.data = OuterOptional{
            middle: null,
            x: 55,
        };
    }
}