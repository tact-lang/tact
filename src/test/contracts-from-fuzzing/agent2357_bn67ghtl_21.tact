struct DeepOptionalNest {
    a: Int;
    b: Int?;
    c: Inner?;
}

struct Inner {
    x: Int?;
}

contract WithDeepOptional {
    val: DeepOptionalNest;

    init() {
        self.val = DeepOptionalNest{
            a: 1,
            b: null,
            c: null
        };
    }
}
