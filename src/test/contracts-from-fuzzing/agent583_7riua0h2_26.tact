struct One {
    a: Int?;
}

struct Two {
    b: One?;
}

struct Three {
    c: Two?;
}

contract OptionalNest {
    val: Three;

    init() {
        self.val = Three{
            c: Two{
                b: One{
                    a: null,
                },
            },
        };
    }
}