struct NullableNest {
    innerOpt: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract NullableNestTest {
    field: NullableNest;

    init() {
        self.field = NullableNest{
            innerOpt: null,
        };
    }
}