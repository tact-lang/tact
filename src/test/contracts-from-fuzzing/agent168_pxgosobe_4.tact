struct ComplexNested {
    a: Int;
    b: Bool;
    c: Inner;
    d: Inner?;
}

struct Inner {
    x: Int;
    y: String;
}

contract TestNestedStructs {
    val: ComplexNested;

    init() {
        self.val = ComplexNested{
            a: 12,
            b: false,
            c: Inner { x: 1, y: "hi" },
            d: null,
        };
    }
}