struct S {
    x: Int;
}

struct WrapOpt {
    wrapped: S?;
}

contract OptionalStructField {
    val: WrapOpt;

    init() {
        self.val = WrapOpt{ wrapped: null };
    }
}