struct Mid {
    foo: Int?;
    bar: Bool?;
}

struct Wrap {
    x: Mid?;
    y: Mid?;
}

contract OptionalWrap {
    data: Wrap;

    init() {
        self.data = Wrap{
            x: null,
            y: Mid{
                foo: 2,
                bar: false,
            },
        };
    }
}