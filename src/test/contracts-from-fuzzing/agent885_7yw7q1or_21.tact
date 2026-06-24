// Large nested struct tree with several levels deep, combined with optionals
struct Bottom {
    foo: Int;
    bar: String?;
}

struct Middle {
    left: Bottom?;
    right: Bottom;
}

struct Top {
    mid: Middle;
    value: Bool?;
}

contract LargeNested {
    data: Top;

    init() {
        self.data = Top {
            mid: Middle {
                left: null,
                right: Bottom { foo: 42, bar: null }
            },
            value: true
        };
    }
}
