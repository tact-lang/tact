struct SubStruct {
    x: Int;
    y: Int;
}

struct OuterWrapper {
    a: Int;
    b: SubStruct?;
    c: Bool;
}

contract OptionalNestedStructField {
    data: OuterWrapper;
    init() {
        self.data = OuterWrapper{
            a: 42,
            b: null,
            c: true
        };
    }
}
