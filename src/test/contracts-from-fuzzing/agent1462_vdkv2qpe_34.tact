// nested optional struct with mixed optionals inside
struct InnerM {
    foo: Int?;
    bar: Bool?;
}

struct MiddleM {
    inner: InnerM?;
}

struct OuterM {
    mid: MiddleM?;
}

contract DeepOptMix {
    m: OuterM;

    init() {
        self.m = OuterM{ mid: null };
    }
}