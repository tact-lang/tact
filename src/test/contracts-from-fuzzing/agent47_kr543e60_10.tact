// deeply nested optionals inside structs and contract field
struct InnerMost {
    z: Int?;
}

struct Mid {
    inner: InnerMost?;
}

struct Outer {
    mid: Mid?;
}

contract DeepOptionalChain {
    data: Outer;

    init() {
        self.data = Outer{
            mid: null,
        };
    }
}