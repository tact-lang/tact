// deep optional chain and explicit non-null inner values
struct InnerMost {
    z: Int?;
}

struct Mid {
    inner: InnerMost?;
}

struct Outer {
    mid: Mid?;
}

contract DeepOptionValue {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Mid{
                inner: InnerMost{
                    z: 999,
                },
            },
        };
    }
}