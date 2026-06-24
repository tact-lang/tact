struct One {
    a: Int;
}

struct Two {
    one: One;
    val: Int;
}

struct Three {
    two: Two;
    b: Bool;
}

contract BigNesting {
    data: Three;

    init() {
        self.data = Three{
            two: Two{
                one: One{
                    a: 123
                },
                val: 456
            },
            b: true
        };
    }
}