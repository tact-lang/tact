struct Base {
    a: Int;
    b: String?;
}

struct Middle {
    inner: Base?;
}

struct Top {
    middle: Middle?;
}

contract NestedNesting {
    data: Top;

    init() {
        self.data = Top{
            middle: Middle{
                inner: Base{
                    a: 7,
                    b: null,
                },
            },
        };
    }
}
