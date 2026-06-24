struct Deep {
    x: Int;
    y: Bool;
}

struct Mid {
    z: Deep;
    w: Int?;
}

struct Top {
    m: Mid;
    s: String;
}

contract DeepFields {
    top: Top;

    init() {
        self.top = Top{
            m: Mid{
                z: Deep{
                    x: 1,
                    y: true,
                },
                w: null,
            },
            s: "test",
        };
    }
}