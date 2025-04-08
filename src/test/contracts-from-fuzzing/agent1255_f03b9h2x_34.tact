struct Nested {
    foo: Int;
    extra: Slice as remaining;
}

struct Wrap {
    payload: Nested?;
}

contract Test34 {
    data: Wrap;

    init() {
        self.data = Wrap{
            payload: null,
        };
    }
}