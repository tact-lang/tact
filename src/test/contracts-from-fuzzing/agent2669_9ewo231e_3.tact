struct Inner {
    x: Int;
    y: Bool;
}

struct Mid {
    inner: Inner;
    z: String;
}

struct Outer {
    mid: Mid;
    q: Int?;
}

contract DeepNested {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Mid{
                inner: Inner{
                    x: 5,
                    y: true,
                },
                z: "mid",
            },
            q: null,
        };
    }
}
