struct InnerStruct {
    x: Int;
    y: Bool;
}

struct OuterStruct {
    inner1: InnerStruct;
    inner2: InnerStruct?;
    x: Int;
    y: Bool;
    maybeStr: String?;
}

contract OptionalNestedStructs {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            inner1: InnerStruct{ x: 1, y: true },
            inner2: null,
            x: 42,
            y: false,
            maybeStr: null,
        };
    }
}