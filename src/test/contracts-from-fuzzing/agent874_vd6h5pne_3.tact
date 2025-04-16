struct Deep {
    x: Int;
    y: Bool?;
}

struct Mid {
    inner: Deep;
    z: String;
}

contract TestContract {
    data: Mid;

    init() {
        self.data = Mid{
            inner: Deep{
                x: 10,
                y: null,
            },
            z: "deep nesting",
        };
    }
}
