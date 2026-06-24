struct DeepOptionals {
    a: Int?;
    b: Bool?;
}

struct MiddleLayer {
    nested: DeepOptionals?;
    c: Int;
}

contract OptionalNested {
    s: MiddleLayer?;
    val: Bool;

    init() {
        self.s = MiddleLayer{
            nested: DeepOptionals{
                a: 7,
                b: null
            },
            c: 42
        };
        self.val = true;
    }
}