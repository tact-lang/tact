struct Bottom {
    foo: Int = 7;
    bar: String?;
}

struct Mid {
    nest: Bottom;
}

struct Top {
    layer: Mid;
}

contract Test32 {
    data: Top;

    init() {
        self.data = Top{
            layer: Mid{
                nest: Bottom{
                    bar: null,
                },
            },
        };
    }
}