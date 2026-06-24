struct Nested {
    x: Int;
    y: Inner;
}

struct Inner {
    z: Bool;
    opt: Int?;
}

contract Test {
    val: Nested?;

    init() {
        self.val = Nested {
            x: 1,
            y: Inner {
                z: false,
                opt: null,
            },
        };
    }
}