// Deep nested struct tree with many optionals interleaved and some defaults
struct InnerMost {
    a: Int?;
    b: String = "def";
    c: Bool?;
}

struct Mid {
    inner: InnerMost?;
    tag: String;
}

struct OuterMost {
    mid: Mid?;
    flag: Bool;
}

contract DeepDefaultMix {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            mid: null,
            flag: true
        };
    }
}