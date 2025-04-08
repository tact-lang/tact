struct Complex {
    nInt: Int;
    nStr: String?;
    nInner: Nested?;
}

struct Nested {
    x: Int;
}

contract OptionalInsideStruct {
    val: Complex;

    init() {
        self.val = Complex{
            nInt: 42,
            nStr: null,
            nInner: null
        };
    }
}