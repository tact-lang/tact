struct Inner {
    field1: Int;
    field2: Bool;
}

struct Wrapper {
    wrapped: Inner;
    optionalWrapped: Inner?;
}

contract Test {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            wrapped: Inner{ field1: 1, field2: true },
            optionalWrapped: null
        };
    }
}
